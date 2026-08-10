# CAMG — Plan de Pérennité à vie

**Objectif : jamais de honte le 3ème jour.**

## 1. Code à jamais
- Dépôt GitHub privé : github.com/daniel-onema/camg-moneyable
- Chaque leçon est un commit. Historique complet.

## 2. Hébergement pérenne
- Front : Vercel (99.99% uptime)
- Base : Supabase PostgreSQL (sauvegarde auto quotidienne 02h)
- Domaine : camg.cd (10 ans)

## 3. Séparation Public / Privé
- `published = true` → élève voit
- `published = false` → caché, toi seul vois
- RLS active : l'élève ne peut JAMAIS lire un brouillon même s'il pirate

## 4. Hors connexion
- Service Worker v3 déjà actif
- Après 1 ouverture, 30 jours sans internet

## 5. Coût
- Hébergement 12$/mois → couvert par 3 abonnés Essentiel
