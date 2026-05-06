# Google Drive image links and automatic photo resizing

Problem:
Google Drive sharing links are not direct image files, so normal <img> or CSS background-image may not load.

This package adds:
- normalizeImageUrl(url)
- cssImageUrl(url)
- automatic conversion of common Google Drive image links to:
  https://drive.google.com/thumbnail?id=FILE_ID&sz=w1600
- automatic image resizing with CSS:
  max-width: 100%
  object-fit: cover
  background-size: cover
- fallback image if a photo fails to load

Use these Google Drive link formats in admin:
1. https://drive.google.com/file/d/FILE_ID/view?usp=sharing
2. https://drive.google.com/open?id=FILE_ID
3. https://drive.google.com/uc?id=FILE_ID

Important Google Drive setting:
The image file must be shared as:
Anyone with the link can view

Better long-term option:
Use Supabase Storage for company photos and paste the public URL into admin.
