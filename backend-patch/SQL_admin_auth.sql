-- ============================================================
-- EndoCraft — Admin Auth + RLS Lockdown
-- Run in Supabase SQL Editor (after running the original cards SQL)
-- ============================================================

-- ============================================================
-- SUBSCRIBERS — lock SELECT behind authenticated role
-- ============================================================
alter table public.subscribers enable row level security;

-- Drop any permissive SELECT policies
drop policy if exists "subscribers_select_all" on public.subscribers;
drop policy if exists "Enable read access for all users" on public.subscribers;

-- Create authenticated-only SELECT policy (admin needs to be logged in)
create policy "subscribers_select_auth" on public.subscribers
  for select
  using (auth.role() = 'authenticated');

-- Ensure INSERT still works for public subscribe flow
drop policy if exists "subscribers_insert_service" on public.subscribers;
drop policy if exists "subscribers_insert_public" on public.subscribers;

create policy "subscribers_insert_anon" on public.subscribers
  for insert
  with check (true);


-- ============================================================
-- CARDS — lock SELECT behind authenticated role
-- ============================================================
-- (RLS already enabled from earlier SQL)

drop policy if exists "cards_select_all" on public.cards;

create policy "cards_select_auth" on public.cards
  for select
  using (auth.role() = 'authenticated');

-- Keep the insert policy (from earlier SQL) — public save-card flow needs it
-- (cards_insert_service should already exist)


-- ============================================================
-- SESSIONS — lock SELECT behind authenticated role
-- ============================================================
alter table public.sessions enable row level security;

drop policy if exists "sessions_select_all" on public.sessions;
drop policy if exists "Enable read access for all users" on public.sessions;

create policy "sessions_select_auth" on public.sessions
  for select
  using (auth.role() = 'authenticated');

-- Keep INSERT/UPDATE open for the public flow (scroll generates sessions)
drop policy if exists "sessions_insert_anon" on public.sessions;
create policy "sessions_insert_anon" on public.sessions
  for insert
  with check (true);

drop policy if exists "sessions_update_anon" on public.sessions;
create policy "sessions_update_anon" on public.sessions
  for update using (true) with check (true);


-- ============================================================
-- Verify policies (sanity check — run this after the above)
-- ============================================================
-- SELECT tablename, policyname, cmd, roles, qual FROM pg_policies
-- WHERE schemaname = 'public' AND tablename IN ('subscribers','cards','sessions');

-- Expected output after running all above:
-- subscribers: subscribers_select_auth (SELECT, auth-only), subscribers_insert_anon (INSERT, open)
-- cards:       cards_select_auth (SELECT, auth-only), cards_insert_service (INSERT, open)
-- sessions:    sessions_select_auth (SELECT, auth-only), sessions_insert_anon, sessions_update_anon
