#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_macos.sh"


#==================================
# Print Section Title
#==================================
print_section "Installing Packages"


#==================================
# Install Brew
#==================================
print_title "Installing Brew"
if ! cmd_exists "brew"; then
	printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	#  └─ simulate the ENTER keypress
fi
print_result $? "Homebrew"

brew_update
brew_upgrade


#==================================
# Brew Tap
#==================================
print_title "Tapping Brew Packages"
brew_tap 'homebrew/core'
brew_tap 'homebrew/bundle'
brew_tap 'homebrew/cask' || true
brew_tap 'homebrew/cask-versions'
brew_tap 'homebrew/cask-fonts'
brew_tap 'eth-p/software'
brew_tap 'teamookla/speedtest'


#==================================
# Brew Install
#==================================
print_title "Installing Brew Packages"
brew_install "wget" "wget"
brew_install "mas" "mas"
brew_install "fd" "fd"
brew_install "git" "git"
brew_install "git" "git-lfs"
brew_install "git" "git-delta"
brew_install "lazygit" "lazygit"
brew_install "git" "git-quick-stats"

#==================================
# Brew Install "fasd" "fasd" not working
# using this instead:
# Preserve the current working directory
#CURRENT_DIR="$(pwd)"

#print_title "Installing fasd (manually)"

#if ! command -v git &>/dev/null || ! command -v make &>/dev/null; then
#    echo "Error: git and make are required but not installed."
#    exit 1
#fi


# Clone fasd only if missing
#if [ ! -d "$HOME/.fasd" ]; then
#    git clone https://github.com/clvv/fasd.git "$HOME/.fasd"
#fi

# Navigate to fasd directory without affecting the script's execution
#(  
#    cd "$HOME/.fasd" || exit 1
#   PREFIX="$HOME/.local" make install
#)

# Restore the original working directory
#cd "$CURRENT_DIR"

# Add fasd to shell environment without overwriting existing variables
#if ! grep -q "fasd --init auto" "$HOME/.zshrc"; then
#    echo 'eval "$(fasd --init auto)"' >> "$HOME/.zshrc"
#fi
#if ! grep -q "fasd --init auto" "$HOME/.bashrc"; then
#    echo 'eval "$(fasd --init auto)"' >> "$HOME/.bashrc"
#fi

# Reload shell config (non-blocking)
#exec "$HOME/.zshrc" || exec "$HOME/.bashrc"

#print_result $? "Installed fasd"
#==================================

brew_install "fzf" "fzf"
brew_install "dockutil" "dockutil"
brew_install "cloc" "cloc"
brew_install "navi" "navi"
brew_install "nano" "nano"
brew_install "node" "node"
brew_install "yarn" "yarn"
brew_install "mono" "mono"
brew_install "gcc" "gcc"
brew_install "gum" "gum"
brew_install "shellcheck" "shellcheck"
brew_install "less" "less"
brew_install "tre" "tre-command"
brew_install "tree" "tree"
brew_install "prettyping" "prettyping"
brew_install "mtr" "mtr"
brew_install "eza" "eza"
brew_install "bat" "bat"
brew_install "bat-extras" "eth-p/software/bat-extras"
brew_install "viu" "viu"
brew_install "htop" "htop"
brew_install "pidof" "pidof"
brew_install "httpie" "httpie"
brew_install "neofetch" "neofetch"
brew_install "neovim" "neovim"
brew_install "micro" "micro"
brew_install "tmux" "tmux"
brew_install "ripgrep" "ripgrep"
brew_install "ranger" "ranger"
brew_install "midnight" "midnight-commander"
brew_install "ffmpeg" "ffmpeg"
brew_install "speedtest" "speedtest"
brew_install "tldr" "tldr"
#brew_install "spotify-tui" "spotify-tui"
brew_install "no-more-secrets" "no-more-secrets"
brew_install "yabai" "koekeishiya/formulae/yabai"

sudo yabai --install-service
sudo launchctl kickstart -k system/yabai


brew_install "skhd" "koekeishiya/formulae/skhd"
brew_install "cmatrix" "cmatrix"
brew_install "nudoku" "nudoku"


#==================================
# Brew Cask
#==================================
print_title "Installing Brew Casks"
brew_install "Firefox" "firefox" "--cask"
brew_install "Firefox Developer" "firefox-developer-edition" "--cask"
brew_install "Brave Browser" "brave-browser" "--cask"
brew_install "Alacritty" "alacritty" "--cask"
# brew_install "Kitty" "kitty" "--cask"
brew_install "Karabiner-Elements" "karabiner-elements" "--cask"
brew_install "VS Code" "visual-studio-code" "--cask"
brew_install "Unity3D" "unity-hub" "--cask"
brew_install "gpg" "gpg" "--cask"
brew_install "gpg suite" "gpg-suite" "--cask"
brew_install "keybase" "keybase" "--cask"
brew_install "Fork" "fork" "--cask"
brew_install "Keka" "keka" "--cask"
brew_install "Optimage" "optimage" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Slack" "slack" "--cask"
brew_install "Zoom" "zoom" "--cask"
brew_install "Transmission" "transmission" "--cask"
brew_install "Transmit" "transmit" "--cask"
brew_install "OBS Studio" "obs" "--cask"
brew_install "Alfred" "alfred" "--cask"
brew_install "Bartender" "bartender" "--cask"
brew_install "Handbrake" "handbrake" "--cask"
brew_install "Blender" "blender" "--cask"
brew_install "Sketch" "sketch" "--cask"
brew_install "Sip" "sip" "--cask"
brew_install "WhatsApp" "whatsapp" "--cask"
brew_install "Cleanmymac" "cleanmymac" "--cask"
brew_install "Dropbox" "dropbox" "--cask"
brew_install "FiraCode Nerd Font" "font-fira-code-nerd-font" "--cask"


#==================================
# Brew MAS
#==================================
print_title "Installing Brew MAS"
brew_mas_install "XCode", "497799835"
#brew_mas_install "1Password", "1333542190"
#brew_mas_install "Affinity Photo", "824183456"
#brew_mas_install "Affinity Designer", "824171161"
#brew_mas_install "Affinity Publisher", "881418622"
brew_mas_install "Spark", "1176895641"
brew_mas_install "Friendly Streaming Browser", "553245401"
brew_mas_install "Craft", "1487937127"


#==================================
# Brew Services
#==================================
print_title "Starting Brew Services"
brew_start_service "yabai" "yabai"
brew_start_service "skhd" "skhd"


#==================================
# Yarn
#==================================
print_title "Installing Yarn Packages"
yarn_install "Serve" "serve"


#==================================
# Install From Source
#==================================
print_title "Install Packages From Source"

mkdir -p ~/.config/pip
echo "[global]" >> ~/.config/pip/pip.conf
echo "break-system-packages = true" >> ~/.config/pip/pip.conf

# LunarVim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh) -y

# NvChad
# rm -rf ~/.config/nvim
# rm -rf ~/.local/share/nvim
# rm -rf ~/.cache/nvim
# execute "git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1" "NvChad"

# Tmux Plugin Manager (TPM)
execute "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" "TMUX Plugin Manager (TPM)"
