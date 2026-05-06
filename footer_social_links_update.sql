
-- Footer social links.
alter table public.site_settings add column if not exists facebook_url text default '';
alter table public.site_settings add column if not exists x_url text default '';
alter table public.site_settings add column if not exists linkedin_url text default '';
