-- CAMG Moneyable — Schéma pérenne Supabase (PostgreSQL)
-- Public vs Privé géré par RLS (Row Level Security)

-- Extension
create extension if not exists "uuid-ossp";

-- Table modules
create table modules (
  id text primary key,
  emoji text,
  title text not null,
  description text,
  price int not null default 0,
  published boolean not null default false,
  lessons_count int default 0,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Table leçons (détaillées)
create table lessons (
  id uuid primary key default uuid_generate_v4(),
  module_id text references modules(id) on delete cascade,
  title text not null,
  description text,
  image_url text,
  audios text[], -- array d'URLs
  exemples text[],
  video_url text,
  duration text,
  position int not null,
  published boolean not null default false,
  created_at timestamp with time zone default now()
);

-- Table users (apprenants) — TOUJOURS PRIVÉ
create table users (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  phone text not null,
  parcours text,
  xp int default 0,
  status text default 'Essai gratuit',
  created_at timestamp with time zone default now()
);

-- Table paiements — TOUJOURS PRIVÉ
create table payments (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references users(id),
  amount text,
  method text, -- M-Pesa / Orange / Airtel
  status text default 'En attente',
  created_at timestamp with time zone default now()
);

-- RLS : activer
alter table modules enable row level security;
alter table lessons enable row level security;
alter table users enable row level security;
alter table payments enable row level security;

-- Politique PUBLIQUE : élèves ne voient QUE publié = true
create policy "public can read published modules" on modules
  for select using (published = true);
create policy "public can read published lessons" on lessons
  for select using (published = true);

-- Politique PRIVÉE : admin voit tout (via service_role, ou via auth avec role='admin')
-- En pratique, le front admin utilise la clé service_role côté serveur Next.js
-- Les élèves utilisent la clé anon qui ne peut lire que publié=true

-- Index
create index idx_modules_published on modules(published);
create index idx_lessons_module on lessons(module_id);

-- Données initiales (tes 14 modules)
insert into modules (id, emoji, title, description, price, published, lessons_count) values
('m1','🌌','Module 1 — Parlons Français Débutants','90 jours • Français illustré',10,true,12),
('m7','🤔','Philosophie — Bases Solides','Socrate + Sagesse africaine',5,true,15),
('m8','📖','Littérature Négro-Africaine','Césaire, Senghor, Mudimbe',5,true,12),
('m9','✍️','Dissertation Finaliste — Méthodo EXETAT','Intro, Développement, Conclusion',8,true,18),
('m10','📝','TUTO : Remplissage Items — Dissertation','Grille, cotation',3,true,8),
('m11','✅','TUTO : Remplissage Items — Session Ordinaire','QCM, Vrai/Faux',3,true,8);

