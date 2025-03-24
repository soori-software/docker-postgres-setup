USERLIST_PATH="/etc/pgbouncer/userlist.txt"

USERNAME="${DB_USER:-admin}"
PASSWORD="${DB_PASSWORD:-admin123}"

# Generate md5 password hash
encrypted_password="md5$(printf "%s%s" "$PASSWORD" "$USERNAME" | openssl md5 -binary | xxd -p)"

# Update userlist.txt
echo "\"$USERNAME\" \"$encrypted_password\"" > "$USERLIST_PATH"

echo "✅ Userlist updated for $USERNAME"
