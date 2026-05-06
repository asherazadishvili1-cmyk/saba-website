

-- Contact/top bar settings added
alter table public.site_settings add column if not exists topbar_text_ka text default 'ინფრასტრუქტურული და სამშენებლო გადაწყვეტილებები საქართველოში';
alter table public.site_settings add column if not exists topbar_text_en text default 'Infrastructure and construction solutions in Georgia';
alter table public.site_settings add column if not exists email text default 'info@sabagroup.org';
alter table public.site_settings add column if not exists phone text default '+0322995406';
alter table public.site_settings add column if not exists whatsapp_number text default '+0322995406';
alter table public.site_settings add column if not exists viber_number text default '+0322995406';
alter table public.site_settings add column if not exists telegram_number text default '+0322995406';
alter table public.site_settings add column if not exists wechat_number text default '+0322995406';

update public.site_settings
set
  topbar_text_ka = coalesce(nullif(topbar_text_ka,''), 'ინფრასტრუქტურული და სამშენებლო გადაწყვეტილებები საქართველოში'),
  topbar_text_en = coalesce(nullif(topbar_text_en,''), 'Infrastructure and construction solutions in Georgia'),
  email = coalesce(nullif(email,''), 'info@sabagroup.org'),
  phone = coalesce(nullif(phone,''), '+0322995406'),
  whatsapp_number = coalesce(nullif(whatsapp_number,''), '+0322995406'),
  viber_number = coalesce(nullif(viber_number,''), '+0322995406'),
  telegram_number = coalesce(nullif(telegram_number,''), '+0322995406'),
  wechat_number = coalesce(nullif(wechat_number,''), '+0322995406')
where id = 1;
