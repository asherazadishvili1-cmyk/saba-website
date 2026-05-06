SABA website package

What is included:
- index.html (main page)
- projects.html (Leaflet projects map page)
- admin.html (admin panel)
- netlify/functions/projects.js (project CRUD API)
- netlify/functions/settings.js (site settings API)
- supabase_schema.sql (Supabase tables for projects + site_settings)
- netlify.toml (redirects for /api/projects and /api/settings)

New admin options:
- Change header logo (main page + projects page)
- Change category titles/descriptions/background images
- Same category settings are used on both the main page and the projects page
- Add/edit/delete projects and set city pins on Leaflet map

After updating Supabase, run the SQL from supabase_schema.sql so the site_settings table is created.

Map fixed version:
- stable Leaflet map size
- OSM base layer added
- map stays fitted to Georgia border
- ignores country-only city values like Georgia/საქართველო
- pins require city_ka/city_en and valid latitude/longitude


Security / production notes:
- Environment variables must be added in Netlify only:
  SUPABASE_URL
  SUPABASE_SERVICE_ROLE_KEY
  ADMIN_PASSWORD
- Never commit .env files or service role keys into GitHub.
- For real images, use Supabase Storage and paste public image URLs into admin.
- SEO/Open Graph tags were added to index.html and projects.html.
- Map loading fallback/spinner added to projects.html.

Contact updated:
Email: info@sabagroup.org
Phone: +0322995406
