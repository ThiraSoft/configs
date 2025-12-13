echo "🔄 Mise à jour du système..."
sudo pacman -Syu --noconfirm

echo "📦 Installation des paquets..."
sudo pacman -S --needed --noconfirm \
    neovim \
    base-devel \
    alacritty \
    zsh \
    git \
    curl \
    nodejs \
    npm \
    go \
    rust \
    python \
    python-pip \
    xorg-xkbcomp \
    xorg-xkbutils \
	xorg-xset \
    xorg-setxkbmap \
    numlockx \
	xclip \
    xkeyboard-config


# Installer Iosevka Nerd Font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Iosevka.zip"
FONT_DIR="/usr/local/share/fonts/IosevkaNerdFont"
TEMP_DIR=$(mktemp -d)

echo "Installation de Iosevka Nerd Font..."
wget --quiet --show-progress -O "$TEMP_DIR/Iosevka.zip" "$FONT_URL"
sudo mkdir -p "$FONT_DIR"
sudo unzip -q "$TEMP_DIR/Iosevka.zip" -d "$FONT_DIR"
rm -rf "$TEMP_DIR"
sudo fc-cache -fv
echo "Installation de Iosevka Nerd Font terminée."

echo "🐚 Définition de Zsh comme shell par défaut..."
chsh -s "$(which zsh)"

echo "✨ Installation de Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh est déjà installé."
fi

echo "🧹 Nettoyage du cache pacman..."
sudo pacman -Sc --noconfirm

echo "✅ Installation terminée !"
echo "➡️ Déconnecte-toi puis reconnecte-toi pour utiliser Zsh."
echo "🟢 Node version : $(node -v 2>/dev/null || echo 'non disponible')"
echo "🟢 Go version   : $(go version 2>/dev/null || echo 'non disponible')"
echo "🟢 Rust version : $(rustc --version 2>/dev/null || echo 'non disponible')"
echo "🟢 Python       : $(python --version 2>/dev/null || echo 'non disponible')"
