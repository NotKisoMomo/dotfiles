#!/usr/bin/env zsh

DOTFILES_DIR=${0:A:h}
echo "[UPDATE] -> Deploying RYP(dotfiles) config please wait..."

echo "[UPDATE] -> Updating Git submodules..."
git submodule update --init --recursive

local modules=(alacritty nvim zsh)

for module in $modules; do
    local script_path="$DOTFILES_DIR/$module/init.zsh"
    
    if [[ -f "$script_path" ]]; then
        chmod +x "$script_path"
        zsh "$script_path"
    else
        echo "[WARNING] -> No init.zsh found for $module"
    fi
done

echo "[SUCCESS] -> RYP(dotfiles) deployment complete!"

