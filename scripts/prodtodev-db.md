# Dump production databases to file
    ssh esddrupal-prod
    mysqldump -u ngeeadmin -pngee4db! NGEE_Arctic_v2 > ngeedump.sql
    mysqldump -u ngeeadmin -pngee4db! msfa_v2 > msfadump.sql

# Copy to dev
    ssh esddrupal-dev
    scp esddrupal-prod:ngeedump.sql .
    scp esddrupal-prod:msfadump.sql .

# Remove existing databases
    mysql -u ngeeadmin -pngee4db! "DROP DATABASE IF EXISTS NGEE_Arctic_v2"
    mysql -u ngeeadmin -pngee4db! "DROP DATABASE IF EXISTS msfa_v2"

# Run dump
    mysql -u ngeeadmin -pngee4db! < ngeedump.sql
    mysql -u ngeeadmin -pngee4db! < msfadump.sql

# Copy files
    cd /metadata/ngee/
    rsync -avz esddrupal-prod:/metadata/ngee/{pages,draft,submitted,accepted,approved}/ .
