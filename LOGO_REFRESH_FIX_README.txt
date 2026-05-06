SABA logo refresh fix

Problem fixed:
- Old logo appeared during page refresh before Supabase settings loaded.
- Browser/Google thumbnail cache could keep showing the previous logo.

Fix included:
- Static header logo changed to the current Google thumbnail link.
- Website reads cached admin settings immediately from localStorage.
- /api/settings is fetched with no-store and timestamp.
- Logo image URL gets a cache-busting v= timestamp on page load.
- Admin save stores settings in localStorage so next page load uses the new logo immediately.

Current logo URL:
https://drive.google.com/thumbnail?id=10JxjUb4dLHPlMlu1Cce01paOK0Kc9FXY&sz=w1000

After deploy:
1. Upload this ZIP to Netlify.
2. Open admin page and press Ctrl+F5.
3. Save the logo URL again.
4. Open main page and press Ctrl+F5 once.
