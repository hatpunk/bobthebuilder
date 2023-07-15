#!/bin/bash

printf "\n\n\n#---------- Installing Bitwarden ----------#\n\n\n"

# Get .AppImage executable
curl -L "https://vault.bitwarden.com/download/?app=desktop&platform=linux" --output ./Bitwarden.AppImage
BITWARDEN="$(pwd)/Bitwarden.AppImage"

# Set permissions
chmod 755 $BITWARDEN

# Move to new folder
mkdir $HOME/Apps
mv $BITWARDEN $HOME/Apps

# Install pairus icons
sudo dnf install -y papirus-icon-theme

# Create .desktop entry
cat << EOF | tee Bitwarden.desktop &> /dev/null
[Desktop Entry]
Type=Application
Version=1.0
Name=Bitwarden
Icon=/usr/share/icons/Papirus/48x48/apps/bitwarden.svg
Exec=/home/$USER/Apps/Bitwarden.AppImage
Terminal=false
MimeType=x-scheme-handler/bitwarden;text/html;
EOF

# Move entry to .desktop local applications folder
mv ./Bitwarden.desktop $HOME/.local/share/applications/

printf "#---------- Bitwarden Installed ----------#"
