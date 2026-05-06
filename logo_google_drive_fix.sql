-- Optional: set SABA header logo from the provided Google Drive link.
-- Run in Supabase SQL Editor only if you want this exact logo saved in database.

update public.site_settings
set
  logo_url = 'https://drive.google.com/thumbnail?id=10JxjUb4dLHPlMlu1Cce01paOK0Kc9FXY&sz=w1000',
  logo_alt = 'SABA',
  updated_at = now()
where id = 1;

notify pgrst, 'reload schema';
