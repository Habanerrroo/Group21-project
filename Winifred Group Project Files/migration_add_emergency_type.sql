-- Migration: Add 'emergency' to incident types
-- Run this in Supabase SQL Editor

-- First, drop the existing check constraint
ALTER TABLE public.incidents 
DROP CONSTRAINT IF EXISTS incidents_type_check;

-- Add the new constraint with 'emergency' included
ALTER TABLE public.incidents 
ADD CONSTRAINT incidents_type_check 
CHECK (type IN ('theft', 'assault', 'harassment', 'fire', 'medical', 'emergency', 'other'));

