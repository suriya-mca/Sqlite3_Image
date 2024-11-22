#!/bin/sh

# Function to configure database settings
configure_database() {
    local db_file=$1
    echo "Configuring settings for $db_file..."
    sqlite3 "$db_file" <<EOF
PRAGMA journal_mode=WAL;
PRAGMA synchronous=NORMAL;
.quit
EOF
}

# Initialize default database if it doesn't exist
if [ ! -f /data/sqlite.db ]; then
    echo "Creating new default SQLite database..."
    sqlite3 /data/sqlite.db "VACUUM;"
fi

# Configure settings for default database
configure_database /data/sqlite.db

# Configure settings for any .db files in the data directory
for db_file in /data/*.db; do
    if [ "$db_file" != "/data/sqlite.db" ]; then
        configure_database "$db_file"
    fi
done

echo "SQLite DB started at port: 8191"
echo "Settings configured for all databases:"
echo "- journal_mode=WAL (Write-Ahead Logging enabled)"
echo "- synchronous=NORMAL (Better performance while maintaining reliability)"

echo "Available databases in /data:"
ls -1 /data/*.db 2>/dev/null

# Create a simple script to switch databases
cat > /switch_db.sh <<EOF
#!/bin/sh
echo "Available databases:"
ls -1 /data/*.db 2>/dev/null
echo ""
echo "Enter database name (e.g., sqlite.db or example.db):"
read dbname
if [ -f "/data/\$dbname" ]; then
    sqlite3 "/data/\$dbname"
else
    echo "Database not found!"
fi
EOF
chmod +x /switch_db.sh

echo ""
echo "To switch databases:"
echo "1. Open a new terminal"
echo "2. Run: docker exec -it <container_id> sh /switch_db.sh"

# Start SQLite and keep container running
sqlite3 /data/sqlite.db ".databases" && \
tail -f /dev/null