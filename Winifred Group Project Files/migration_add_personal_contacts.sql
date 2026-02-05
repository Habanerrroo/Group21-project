-- Migration: Add personal_contacts table
-- Run this in Supabase SQL Editor if you already have the database set up

-- Personal Emergency Contacts Table (user's personal contacts)
CREATE TABLE IF NOT EXISTS public.personal_contacts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  relationship TEXT,
  is_primary BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index
CREATE INDEX IF NOT EXISTS idx_personal_contacts_user_id ON public.personal_contacts(user_id);

-- Enable RLS
ALTER TABLE public.personal_contacts ENABLE ROW LEVEL SECURITY;

-- RLS Policies
DROP POLICY IF EXISTS "Users can view their own personal contacts" ON public.personal_contacts;
CREATE POLICY "Users can view their own personal contacts"
  ON public.personal_contacts FOR SELECT
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create their own personal contacts" ON public.personal_contacts;
CREATE POLICY "Users can create their own personal contacts"
  ON public.personal_contacts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update their own personal contacts" ON public.personal_contacts;
CREATE POLICY "Users can update their own personal contacts"
  ON public.personal_contacts FOR UPDATE
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete their own personal contacts" ON public.personal_contacts;
CREATE POLICY "Users can delete their own personal contacts"
  ON public.personal_contacts FOR DELETE
  USING (auth.uid() = user_id);

-- Create trigger for updated_at
DROP TRIGGER IF EXISTS update_personal_contacts_updated_at ON public.personal_contacts;
CREATE TRIGGER update_personal_contacts_updated_at
  BEFORE UPDATE ON public.personal_contacts
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();


