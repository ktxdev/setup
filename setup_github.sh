#!/bin/bash

# Configuration
EMAIL="$1"
SSH_KEY_PATH="$HOME/.ssh/github_ed25519"

if [ -z "$EMAIL" ]; then
  echo "Usage: $0 your_email@example.com"
  exit 1
fi

# Step 1: Generate SSH key if not exists
if [ -f "$SSH_KEY_PATH" ]; then
  echo "SSH key already exists at $SSH_KEY_PATH"
else
  echo "Generating a new SSH key..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$SSH_KEY_PATH" -N ""
fi

# Step 2: Start SSH agent and add key
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY_PATH"

# Step 3: Print public key
echo ""
echo "🔑 Your public SSH key (copy and add to GitHub):"
echo ""
cat "$SSH_KEY_PATH.pub"
echo ""
echo "👉 Visit https://github.com/settings/ssh/new to add this key."

# Step 4: Optional GitHub SSH test
read -p "Do you want to test SSH connection to GitHub now? (y/n): " yn

case $yn in
  [Yy]* ) ssh -T git@github.com ;;
  * ) echo "SSH test skipped." ;;
esac
