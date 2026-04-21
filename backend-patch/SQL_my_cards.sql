-- ============================================================
-- EndoCraft — /my-cards Support
-- Adds owner_slug column (deterministic hash of email) for semi-private URLs
-- Run in Supabase SQL Editor
-- ============================================================

-- Enable pgcrypto if not already (for SHA-256 computation in the backfill)
create extension if not exists pgcrypto;

-- Add the slug column
alter table public.cards
  add column if not exists owner_slug text;

-- Backfill existing cards: slug = first 16 hex chars of sha256(lowercase email)
-- This matches what the backend computes at write-time
update public.cards
set owner_slug = substring(encode(digest(lower(trim(email)), 'sha256'), 'hex') from 1 for 16)
where owner_slug is null and email is not null;

-- Index for fast /my-cards lookup
create index if not exists idx_cards_owner_slug on public.cards(owner_slug);

-- Add public-but-slug-filtered SELECT policy (backend proxies all reads so this is defense-in-depth)
-- Anonymous users can SELECT a card only if they already know its owner_slug (so they already have access)
-- In practice, the backend uses service_role and bypasses RLS — this policy exists as a safety net only
-- ❌ DISABLED for now — backend handles all my-cards reads via service_role.
-- If later you want direct-from-client reads (e.g. for extreme performance), uncomment below:
--
-- create policy "cards_select_by_slug" on public.cards
--   for select using (
--     owner_slug = current_setting('request.headers', true)::json->>'x-owner-slug'
--   );

-- Verify
select count(*) as total_cards,
       count(owner_slug) as cards_with_slug,
       count(*) - count(owner_slug) as missing
from public.cards;
