create extension if not exists pgcrypto;

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title_ka text not null,
  title_en text not null,
  category text not null default 'water',
  description_ka text not null,
  description_en text not null,
  location_ka text default '',
  location_en text default '',
  status_ka text default '',
  status_en text default '',
  image_url text default '',
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.projects add column if not exists city_ka text default '';
alter table public.projects add column if not exists city_en text default '';
alter table public.projects add column if not exists latitude double precision;
alter table public.projects add column if not exists longitude double precision;

alter table public.projects drop constraint if exists projects_category_check;
alter table public.projects add constraint projects_category_check check (category in ('water','roads','drainage','sewerage','civil','concrete'));

alter table public.projects enable row level security;
drop policy if exists "Public can read projects" on public.projects;
create policy "Public can read projects" on public.projects for select to anon, authenticated using (true);

create table if not exists public.site_settings (
  id integer primary key default 1 check (id = 1),
  logo_url text default '',
  logo_alt text default 'SABA',
  water_title_ka text not null default 'წყლის ინფრასტრუქტურა',
  water_title_en text not null default 'Water Infrastructure',
  water_description_ka text not null default 'ქსელების მშენებლობა, რეაბილიტაცია, რეზერვუარები და სატუმბი სადგურები.',
  water_description_en text not null default 'Network construction, rehabilitation, reservoirs and pumping stations.',
  water_image_url text default 'https://images.unsplash.com/photo-1581094288338-2314dddb7ece?auto=format&fit=crop&w=1400&q=80',
  roads_title_ka text not null default 'გზები და სამოქალაქო სამუშაოები',
  roads_title_en text not null default 'Roads & Civil Works',
  roads_description_ka text not null default 'გზები, მიწის სამუშაოები, ბეტონის კონსტრუქციები და სამშენებლო სამუშაოები.',
  roads_description_en text not null default 'Roads, earthworks, concrete structures and civil construction works.',
  roads_image_url text default 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?auto=format&fit=crop&w=1400&q=80',
  drainage_title_ka text not null default 'კანალიზაცია და დრენაჟი',
  drainage_title_en text not null default 'Sewerage & Drainage',
  drainage_description_ka text not null default 'სანიაღვრე სისტემები, კოლექტორები, ჭები და ქსელების რეაბილიტაცია.',
  drainage_description_en text not null default 'Stormwater systems, collectors, manholes and network rehabilitation.',
  drainage_image_url text default 'https://images.unsplash.com/photo-1591955506264-3f5a6834570a?auto=format&fit=crop&w=1400&q=80',
  updated_at timestamptz default now()
);

insert into public.site_settings (id) values (1) on conflict (id) do nothing;

alter table public.site_settings enable row level security;
drop policy if exists "Public can read site settings" on public.site_settings;
create policy "Public can read site settings" on public.site_settings for select to anon, authenticated using (true);


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


-- Footer social links.
alter table public.site_settings add column if not exists facebook_url text default '';
alter table public.site_settings add column if not exists x_url text default '';
alter table public.site_settings add column if not exists linkedin_url text default '';


-- Final contact/social settings for SABA.
alter table public.site_settings add column if not exists topbar_text_ka text default 'ინფრასტრუქტურული და სამშენებლო გადაწყვეტილებები საქართველოში';
alter table public.site_settings add column if not exists topbar_text_en text default 'Infrastructure and construction solutions in Georgia';
alter table public.site_settings add column if not exists email text default 'info@sabagroup.org';
alter table public.site_settings add column if not exists phone text default '+0322995406';
alter table public.site_settings add column if not exists whatsapp_number text default '+0322995406';
alter table public.site_settings add column if not exists wechat_number text default '+0322995406';
alter table public.site_settings add column if not exists facebook_url text default '';
alter table public.site_settings add column if not exists x_url text default '';
alter table public.site_settings add column if not exists linkedin_url text default '';

update public.site_settings
set
  topbar_text_ka = coalesce(nullif(topbar_text_ka,''), 'ინფრასტრუქტურული და სამშენებლო გადაწყვეტილებები საქართველოში'),
  topbar_text_en = coalesce(nullif(topbar_text_en,''), 'Infrastructure and construction solutions in Georgia'),
  email = coalesce(nullif(email,''), 'info@sabagroup.org'),
  phone = coalesce(nullif(phone,''), '+0322995406'),
  whatsapp_number = coalesce(nullif(whatsapp_number,''), phone, '+0322995406'),
  wechat_number = coalesce(nullif(wechat_number,''), phone, '+0322995406')
where id = 1;
