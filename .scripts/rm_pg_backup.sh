find /Users/joao/Cloud/GDrive/Backup/Archives/PGSQL/daily/ -mindepth 1 -type f -mtime +6h -delete;
find /Users/joao/Cloud/GDrive/Backup/Archives/PGSQL/weekly/ -mindepth 1 -type f -mtime +6h -delete;
find /Users/joao/Cloud/GDrive/Backup/Archives/PGSQL/monthly/ -mindepth 1 -type f -mtime +6h -delete;
find /Volumes/Chapterhouse/Archives/PGSQL/daily/ -mindepth 1 -type f -mtime +7 -delete;
find /Volumes/Chapterhouse/Archives/PGSQL/weekly/ -mindepth 1 -type f -mtime +30 -delete;
find /Volumes/Chapterhouse/Archives/PGSQL/monthly/ -mindepth 1 -type f -mtime +180 -delete;
find /Users/joao/Cloud/GDrive/Backup/Archives/pg_backups -maxdepth 1 -type d -mtime +6h -exec rm -rf '{}' ';'
find /Volumes/Chapterhouse/Archives/pg_backups -maxdepth 1 -type d -name "*-daily" -mtime +7 -exec rm -rf '{}' ';'
find /Volumes/Chapterhouse/Archives/pg_backups -maxdepth 1 -type d -name "*-weekly" -mtime +30 -exec rm -rf '{}' ';'
find /Volumes/Chapterhouse/Archives/pg_backups -maxdepth 1 -type d -name "*-plain" -mtime +30 -exec rm -rf '{}' ';'
find /Volumes/Chapterhouse/Archives/pg_backups -maxdepth 1 -type d -name "*-monthly" -mtime +180 -exec rm -rf '{}' ';'
