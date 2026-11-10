create table if not exists public.ml_credentials (
  id integer primary key check (id = 1),
  access_token text not null,
  refresh_token text not null,
  expires_at timestamptz not null,
  ml_user_id text,
  updated_at timestamptz not null default now()
);

alter table public.ml_credentials enable row level security;

insert into public.ml_credentials (
  id, access_token, refresh_token, expires_at
)
values (
  1, 'pending', 'pending', now()
)
on conflict (id) do nothing;
