-- ============================================================
-- 奥德赛计划 · Supabase 建表 SQL
-- 在 Supabase SQL Editor 中粘贴执行：
-- https://supabase.com/dashboard/project/eeuvrabunfvsaxgpaiub/sql/new
-- ============================================================

-- 1. 建表
CREATE TABLE IF NOT EXISTS odyssey_submissions (
  id        BIGSERIAL PRIMARY KEY,
  device    TEXT NOT NULL CHECK (device IN ('mobile', 'desktop')),
  created_at TIMESTAMPTZ DEFAULT NOW()
  -- 只记录：什么设备 + 什么时间，不存任何个人信息
);

-- 2. 启用 RLS
ALTER TABLE odyssey_submissions ENABLE ROW LEVEL SECURITY;

-- 3. 允许匿名 INSERT + SELECT
DROP POLICY IF EXISTS "anon_insert_odyssey" ON odyssey_submissions;
CREATE POLICY "anon_insert_odyssey" ON odyssey_submissions
  FOR INSERT TO anon WITH CHECK (true);

DROP POLICY IF EXISTS "anon_select_odyssey" ON odyssey_submissions;
CREATE POLICY "anon_select_odyssey" ON odyssey_submissions
  FOR SELECT TO anon USING (true);
