# 📁 DOSSIER DE CONTINUITÉ — APPLICATION CAMG
> À coller en début de nouvelle conversation pour reprendre le travail exactement là où il s'est arrêté.
> Dernière mise à jour : 12 août 2026.

## 1. LE PROJET
Application web (PWA) du **CAMG — Club des Amis de Maurice et Gréviste**, fondée par **Daniel ONEMA** (Université Mapon, Kindu, Maniema, RDC).
Objectif : leçons audiovisuelles (audios, illustrations, gamifiées) modifiables par l'admin, utilisables **hors connexion**, en deux parties :
- **Partie publique** (tous) : présentation, tarifs, espace client (leçons, XP, badges, streaks, duels).
- **Partie privée sécurisée** (admin seul) : CRUD des modules/leçons, apprenants, paiements, paramètres.

Contenus prévus : français parlé / écrit / professionnel (tous niveaux, étape par étape, exemples, exercices résolus et non résolus, jeux solo/équipe/équipe arbitrée par l'admin, histoires et contes illustrés), latin (débutant → pro, toutes classes), figures de style, simulations EXETAT (dissertation, session ordinaire, remplissage d'items), philosophie, littérature négro-africaine.

## 2. LIENS & ACCÈS
- Dépôt GitHub : https://github.com/danielonema135-svg/camg-maniema (branche **main**)
- Site en ligne : https://danielonema135-svg.github.io/camg-maniema/
- Admin de l'app : `admin@camg.cd` / `admin123` (à changer dans Admin → Paramètres)
- Paiements : M-Pesa **+243 82 59 011 17** • Orange Money **+243 89 44 36 77 4**

## 3. VOLONTÉS EXPLICITES DU FONDATEUR (à respecter)
1. **JAMAIS le mot « Moneyable »** — nom officiel : **CAMG**, slogan « Le monde dans ta poche ».
2. **Aucune phrase adressée au fondateur ne doit apparaître en public** (pas de « tes numéros », « ton argumentaire », « modifiable par toi dans Admin », « Immortel », « Validation côté Admin »…). Le public ne voit que des textes orientés client.
3. L'accès **Admin doit être visible et fonctionnel sur téléphone** (bouton 🔒 Admin dans le menu + bouton 🔒 Espace Admin dans le footer).
4. Les **tutos doivent s'ouvrir** (cartes entièrement cliquables).
5. L'app doit s'installer sur téléphone (icône) et marcher **hors connexion**.
6. À chaque étape, préparer un **dossier complet** (celui-ci) pour pouvoir continuer dans une nouvelle conversation.

## 4. HISTORIQUE — CE QUI EST DÉJÀ FAIT
- ✅ **manifest.json** corrigé et commité : `start_url` et `scope` = `/camg-maniema/`, icônes 192+512, nom « CAMG - Le monde dans ta poche ». (Avant, `start_url:"/"` ouvrait une 404 → l'icône installée ne marchait pas.)
- ✅ **README.md** réécrit proprement (sans Moneyable).
- ✅ **index.html** corrigé (fichier prêt, À DÉPOSER dans le dépôt) : menu visible sur mobile, bouton 🔒 Admin (nav + footer), textes confidentiels réécrits/supprimés, cartes tutos cliquables, mot de passe admin masqué de la page publique, titre/logo sans Moneyable.
- ✅ **sw.js** corrigé (fichier prêt, À DÉPOSER) : cache passé de `camg-v3` à `camg-v4` pour forcer la mise à jour hors connexion.

## 5. À FAIRE MAINTENANT (procédure téléphone)
1. Télécharger depuis l'espace de l'assistant les fichiers **index.html** et **sw.js** corrigés.
2. GitHub mobile : bouton **« Code ▾ » → « Upload file »** → choisir `index.html` → **Commit changes**. Recommencer pour `sw.js`. (GitHub remplace le fichier du même nom.)
3. Attendre ~2 min (nouveau déploiement Pages vert).
4. Téléphone : supprimer l'ancienne icône CAMG → Chrome → ouvrir le site → **Recharger une fois** (⋮ → Recharger) → ⋮ → **« Ajouter à l'écran d'accueil »** → ouvrir la nouvelle icône.
5. Tester : bouton **🔒 Admin** → connexion → changer le mot de passe (Paramètres).
6. ⚠️ Piège connu : **désactiver la traduction Google de Chrome sur github.com** (elle traduit le code : « nom » au lieu de « name ») — bouton « Annuler » sur la bannière de traduction.

## 6. NOTES TECHNIQUES POUR L'ASSISTANT
- `index.html` = toute l'app en une page : vues `view-landing`, `view-client`, `view-lesson`, `view-admin-login`, `view-admin` (fonction `showView()`), données dans **localStorage** clé `camg_db_v2` (CRUD local, pas encore de vrai backend ; un dossier `supabase/` existe dans le dépôt pour l'avenir).
- Autres pages : `module-1.html`, `latin.html`, `enfant.html`, `lecon-modele.html`, `installer.html`, `whatsapp-apk.html`, `guide-perennite.html`.
- Service worker `sw.js` : cache-first avec mise à jour en arrière-plan ; changer le nom de CACHE à chaque nouvelle version pour invalider l'ancien.
- Médias existants : `images/` (daniel-icon.png, m1-l1..l3.jpg…), `audio/` (m1-l1-*.mp3, chorale-ensemble.mp3, enfant-lecon1.mp3). Les « tutos vidéo » marketing n'ont pas encore de vrais fichiers médias : la carte 1 ouvre l'onboarding, la 2 va vers latin.html, la 3 vers l'espace client.
- L'utilisateur travaille **uniquement sur téléphone Android/Chrome + GitHub mobile** : donner des instructions geste par geste, courtes, avec les libellés exacts des boutons.

## 7. PROCHAINES ÉTAPES POSSIBLES (souhaits du fondateur)
- Vraies leçons audio/vidéo téléversées via l'admin ; histoires et contes illustrés ; jeux en équipe arbitrés par l'admin.
- Brancher un vrai backend (dossier `supabase/` présent) pour que les modifs de l'admin soient visibles chez TOUS les clients (aujourd'hui : localStorage = par appareil).
- Page `installer.html` / `whatsapp-apk.html` : vérifier et aligner avec la nouvelle version.

## 8. JOURNAL DE PROGRESSION (mis à jour à chaque étape)
- **Étape 1 — FAIT** : Diagnostic du problème « l'icône installée ne s'ouvre pas » : `manifest.json` avait `start_url:"/"` → ouvrait la 404 de la racine GitHub Pages.
- **Étape 2 — FAIT** : `manifest.json` corrigé et commité sur GitHub (start_url + scope `/camg-maniema/`, icônes 192 & 512, nom « CAMG - Le monde dans ta poche », plus de Moneyable).
- **Étape 3 — FAIT** : `README.md` (Lisez-moi) réécrit proprement et commité.
- **Étape 4 — FAIT** : Piège identifié et contourné : la traduction Google de Chrome traduisait le code sur github.com (« nom » au lieu de « name ») → désactivée (« Annuler » sur la bannière).
- **Étape 5 — FAIT** : `index.html` corrigé (menu + 🔒 Admin visibles sur mobile, textes confidentiels réécrits, tutos cliquables, mot de passe masqué) et `sw.js` (cache `camg-v4`) préparés dans l'espace de l'assistant, prêts à téléverser.
- **Étape 6 — EN COURS** : Téléversement sur GitHub : « Code ▾ » → « Upload file » → `index.html` → Commit ; puis recommencer avec `sw.js`.
- **Étape 7 — À FAIRE** : Téléphone : supprimer l'ancienne icône CAMG → Chrome → ouvrir le site → Recharger → ⋮ → « Ajouter à l'écran d'accueil » → ouvrir l'icône.
- **Étape 8 — À FAIRE** : Tester 🔒 Admin (admin@camg.cd / admin123) puis changer le mot de passe dans Paramètres.
- **Étape 9 — À FAIRE** : Vérifier côté public : aucun texte confidentiel, tutos qui s'ouvrent, nom CAMG partout.
- **Étape 10 — FAIT** : Signalement du fondateur : le paragraphe « L'HISTOIRE VRAIE » (« tu as compris… ») et le texte du haut (« Tu as connu l'exil… ») s'adressaient à lui → réécrits à la 3e personne (histoire du fondateur racontée au public). index.html mis à jour dans l'espace de l'assistant → à RETÉLÉVERSER (remplace l'ancien).
- **Étape 11 — FAIT** : Vrais tutos audio créés (voix pro française choisie par le fondateur, voice-00) : audio/tuto1.mp3 (Pourquoi le français), tuto2.mp3 (Latin), tuto3.mp3 (CAMG déjà réel). Intégrés : lecteurs audio dans les 3 cartes + bouton « Écouter » du tutoriel de bienvenue. sw.js → cache camg-v5. Fichiers à téléverser : index.html, sw.js (racine) + les 3 mp3 dans le dossier audio/.
- **Étape 12 — FAIT** : Idée du fondateur adoptée : tutos sous forme de petites scènes théâtre (intox → intrigue → complication → solution CAMG) avec voix de différentes catégories de personnes. Scène 1 « Le piège de la méthode miracle » produite (4 voix : voice-01 narrateur, voice-02 arnaqueur, voice-03 Espoir, voice-04 maman Josée), assemblée en audio/scene1.mp3, section « Théâtre CAMG » ajoutée à index.html. sw.js → camg-v6. À téléverser : scene1.mp3 dans audio/ + index.html + sw.js.
- **Étape 13 — FAIT** : Audios RÉENREGISTRÉS avec voix à accent français (fr-FR) : voice-05 narrateur+tutos, voice-06 arnaqueur, voice-07 Espoir, voice-08 maman Josée. Visuels créés et intégrés : images/tuto1.jpg, tuto2.jpg, tuto3.jpg (en-têtes des cartes tutos) + scene1.jpg (théâtre). sw.js → camg-v7.
- **Étape 14 — NOTE** : Limite de 10 audios/turn atteinte : la dernière réplique de la scène (« Espoir a commencé le jour même… ») n'a pas pu être régénérée en FR ; la scène se termine provisoirement par le jingle tuto3 (même narrateur FR). À régénérer plus tard si souhaité (s1-narr3.mp3 puis réassembler scene1.mp3).
- **FICHIERS À TÉLÉVERSER (version complète)** : racine → index.html, sw.js ; audio/ → tuto1.mp3, tuto2.mp3, tuto3.mp3, scene1.mp3 ; images/ → tuto1.jpg, tuto2.jpg, tuto3.jpg, scene1.jpg.
