-- Run this in Supabase SQL Editor:
-- https://supabase.com/dashboard/project/eeuvrabunfvsaxgpaiub/sql/new

CREATE TABLE IF NOT EXISTS odyssey_submissions (
  id BIGSERIAL PRIMARY KEY,
  anonymous_id TEXT NOT NULL,
  device TEXT NOT NULL CHECK (device IN ('mobile', 'desktop')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE odyssey_submissions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_insert_odyssey" ON odyssey_submissions;
CREATE POLICY "anon_insert_odyssey" ON odyssey_submissions
  FOR INSERT TO anon WITH CHECK (true);

DROP POLICY IF EXISTS "anon_select_odyssey" ON odyssey_submissions;
CREATE POLICY "anon_select_odyssey" ON odyssey_submissions
  FOR SELECT TO anon USING (true);
