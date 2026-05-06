# Supabase Storage for SABA Images

Current website behavior:
- The database saves image URLs only.
- Actual image files must be hosted somewhere public.

Recommended setup:
1. Open Supabase project.
2. Go to Storage.
3. Create a bucket named:
   saba-images
4. Make the bucket public.
5. Upload construction/project/category/logo images there.
6. Copy the public URL.
7. Paste the URL into SABA Admin Panel:
   - project Image URL
   - site settings logo URL
   - category background image URL

Important:
- Do not store SUPABASE_SERVICE_ROLE_KEY inside frontend files.
- Only use public image URLs in the admin panel.
- Keep images optimized, preferably JPG/WebP under 500 KB for faster loading.
