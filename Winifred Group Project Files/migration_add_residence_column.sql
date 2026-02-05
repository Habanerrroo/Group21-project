-- Migration: Add residence column to users table
-- Run this in Supabase SQL Editor

-- Add residence column to users table
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS residence TEXT;

-- Add a comment to document the column
COMMENT ON COLUMN public.users.residence IS 'Student residence/location on campus';

-- Optional: Update existing users with a default value if needed
-- UPDATE public.users SET residence = 'Not specified' WHERE residence IS NULL AND role = 'student';

