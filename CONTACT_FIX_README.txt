What was fixed:
1) Removed/overrode old hardcoded header email and phone scripts.
2) Contact settings now load with cache disabled and re-render after refresh.
3) Admin contact form now saves to local browser cache and tries to save to Supabase.

Important for real public website persistence:
If admin says server save failed, open Supabase > SQL Editor and run final_contact_social_settings.sql from this ZIP once. Then save contact settings again in admin panel.

After deploying this ZIP to Netlify, open the website and press Ctrl+F5.
