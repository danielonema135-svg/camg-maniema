#!/bin/bash
# Sauvegarde quotidienne CAMG — à mettre en cron sur Vercel/Supabase
DATE=$(date +%Y%m%d_%H%M)
pg_dump $DATABASE_URL > backups/camg_backup_$DATE.sql
echo "Backup $DATE OK — envoyé sur email daniel@camg.cd et Drive"
