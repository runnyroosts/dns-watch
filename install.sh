#!/bin/bash
set -e

echo "Installing dns-watch dependencies..."
sudo apt install -y python3-tk python3-paramiko sqlite3

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
chmod +x "$SCRIPT_DIR/dns-watch"

# Symlink to PATH
mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_DIR/dns-watch" "$HOME/.local/bin/dns-watch"

# Desktop entry
DESKTOP_DIR="$HOME/.local/share/applications"
mkdir -p "$DESKTOP_DIR"
cat > "$DESKTOP_DIR/dns-watch.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=DNS Watch
Comment=Live DNS query dashboard for Technitium DNS Server
Exec=dns-watch
Icon=network-server
Terminal=false
Categories=Network;Monitor;System;
Keywords=dns;network;monitor;dashboard;technitium;
EOF

echo ""
echo "Done. Run 'dns-watch' or find it in your app menu."
echo "First launch will open the setup dialog."
