-- Migration: Add phone and residence columns to users table
-- Run this in your Supabase SQL Editor if you already have the users table created

-- Add phone column
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS phone TEXT;

-- Add residence column
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS residence TEXT;

-- Verify the changes
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_schema = 'public' 
  AND table_name = 'users'
ORDER BY ordinal_position;

