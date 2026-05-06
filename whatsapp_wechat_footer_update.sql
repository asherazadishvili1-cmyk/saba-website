
-- WhatsApp / WeChat footer settings.
alter table public.site_settings add column if not exists whatsapp_number text default '+0322995406';
alter table public.site_settings add column if not exists wechat_number text default '+0322995406';

update public.site_settings
set
  whatsapp_number = coalesce(nullif(whatsapp_number,''), phone, '+0322995406'),
  wechat_number = coalesce(nullif(wechat_number,''), phone, '+0322995406')
where id = 1;
