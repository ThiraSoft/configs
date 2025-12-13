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
    xkeyboard-config

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
