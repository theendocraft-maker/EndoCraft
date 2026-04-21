-- ================================================
-- EndoCraft — Cards Table + Sequential Numbering
-- Run in Supabase SQL Editor
-- ================================================

-- Main cards table
create table if not exists public.cards (
  id uuid primary key default gen_random_uuid(),
  number bigserial unique,              -- global sequential: #1 is the first card ever
  misprint_number bigint,               -- only set when rarity='misprint' (via trigger below)
  email text not null,
  session_title text,
  legendary_moment text,
  character_name text,
  character_class text,
  rarity text,
  visible_roll int,
  image_url text,                       -- permanent URL (Supabase Storage later)
  image_url_temp text,                  -- original aimlapi URL (for debugging/fallback)
  seed_hash text,                       -- provenance
  model_vintage text default 'bytedance/seedream-4-5',
  edition text default 'I',
  created_at timestamptz default now()
);

-- Separate sequence for misprint numbering (starts at 1, independent of global card count)
create sequence if not exists misprint_seq start 1;

-- Trigger: auto-fill misprint_number when rarity='misprint'
create or replace function fill_misprint_number()
returns trigger as $$
begin
  if new.rarity = 'misprint' and new.misprint_number is null then
    new.misprint_number := nextval('misprint_seq');
  end if;
  return new;
end;
$$ language plpgsql;

drop trigger if exists cards_misprint_number_trigger on public.cards;
create trigger cards_misprint_number_trigger
before insert on public.cards
for each row execute function fill_misprint_number();

-- Indexes for fast lookup
create index if not exists idx_cards_email on public.cards(email);
create index if not exists idx_cards_created on public.cards(created_at desc);
create index if not exists idx_cards_number on public.cards(number);

-- RLS — allow reads, writes via service role only (your backend holds the key)
alter table public.cards enable row level security;

drop policy if exists "cards_insert_service" on public.cards;
drop policy if exists "cards_select_all" on public.cards;

create policy "cards_insert_service" on public.cards
  for insert with check (true);

create policy "cards_select_all" on public.cards
  for select using (true);

-- Optional: grant sequence usage to authenticated users if needed later
grant usage on sequence misprint_seq to anon, authenticated;
