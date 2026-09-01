#!/bin/sh
set -e

# Default values
HTTP_PORT=${HTTP_PORT:-3128}
SOCKS_PORT=${SOCKS_PORT:-1080}
PROXY_USER=${PROXY_USER:-}
PROXY_PASS=${PROXY_PASS:-}
MAXCONN=${MAXCONN:-500}

CONFIG=/tmp/3proxy.cfg

cat > "$CONFIG" <<EOF
nserver 8.8.8.8
nserver 1.1.1.1
nscache 65536
timeouts 1 5 30 60 180 1800 15 60
maxconn $MAXCONN
log
logformat "L%t %U %C:%c %R:%r %O %I %h %T"

EOF

if [ -n "$PROXY_USER" ] && [ -n "$PROXY_PASS" ]; then
  echo "users $PROXY_USER:CL:$PROXY_PASS" >> "$CONFIG"
  echo "auth strong" >> "$CONFIG"
  echo "allow $PROXY_USER" >> "$CONFIG"
else
  echo "# WARNING: Running without authentication (not recommended)" >> "$CONFIG"
  echo "auth none" >> "$CONFIG"
  echo "allow *" >> "$CONFIG"
fi

cat >> "$CONFIG" <<EOF

# HTTP Proxy
proxy -p$HTTP_PORT

# SOCKS5 Proxy
socks -p$SOCKS_PORT
EOF

echo "Starting 3proxy with config:"
cat "$CONFIG"
echo "----------------------------"

exec 3proxy "$CONFIG"
