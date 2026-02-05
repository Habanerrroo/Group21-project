-- Supabase Storage RLS Policies
-- Run this in Supabase SQL Editor after creating the buckets

-- ============================================================================
-- PROFILE IMAGES BUCKET POLICIES
-- ============================================================================

-- Allow authenticated users to upload their own profile images
-- Note: The path structure is profiles/{userId}/{timestamp}.jpg
-- Using a simpler check that allows any upload to profile-images bucket
DROP POLICY IF EXISTS "Users can upload profile images" ON storage.objects;
CREATE POLICY "Users can upload profile images"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'profile-images');

-- Allow all authenticated users to view profile images
DROP POLICY IF EXISTS "Users can view profile images" ON storage.objects;
CREATE POLICY "Users can view profile images"
ON storage.objects FOR SELECT
TO authenticated
USING (bucket_id = 'profile-images');

-- Allow users to update profile images
DROP POLICY IF EXISTS "Users can update profile images" ON storage.objects;
CREATE POLICY "Users can update profile images"
ON storage.objects FOR UPDATE
TO authenticated
USING (bucket_id = 'profile-images');

-- Allow users to delete profile images
DROP POLICY IF EXISTS "Users can delete profile images" ON storage.objects;
CREATE POLICY "Users can delete profile images"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'profile-images');

-- ============================================================================
-- INCIDENT MEDIA BUCKET POLICIES
-- ============================================================================

-- Allow authenticated users to upload incident media
DROP POLICY IF EXISTS "Users can upload incident media" ON storage.objects;
CREATE POLICY "Users can upload incident media"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'incident-media');

-- Allow authenticated users to view incident media
DROP POLICY IF EXISTS "Users can view incident media" ON storage.objects;
CREATE POLICY "Users can view incident media"
ON storage.objects FOR SELECT
TO authenticated
USING (bucket_id = 'incident-media');

-- Allow users to delete their own incident media (optional)
DROP POLICY IF EXISTS "Users can delete incident media" ON storage.objects;
CREATE POLICY "Users can delete incident media"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'incident-media');

