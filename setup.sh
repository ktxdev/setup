#!/bin/bash

# Constants
GREEN='\033[0;32m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

# Get username
# Ask for the user's name
read -p "Please enter your the system name: " username
read -p "Please enter your the github name: " github_name
read -p "Please enter your the github email: " github_email

if [ -z "$username" ]; then
        echo "Error: No user specified."
        exit 1
fi

ZPROFILE_PATH="/Users/$username/.zprofile"

echo -e "${GREEN}Installing brew...${NO_COLOR}"
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> "$ZPROFILE_PATH"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$ZPROFILE_PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

APPLICATIONS=(
        "brave-browser"
        "git"
        "rectangle"
        "spotify"
        "notion"
        "cursor"
        "intellij-idea"
        "nvm"
        "postman"
        "miniconda"
        "item2"
)

# Install and track the apps installed
installed_apps=()

for app in "${APPLICATIONS[@]}"; do
        echo -e "${GREEN}Installing $app...${NO_COLOR}"
        brew install "$app"
        if [ $? -eq 0 ]; then
                ininstalled_apps+=("$app")
        else
                echo -e "${RED}Failed to install $app.${NO_COLOR}"
        fi
done

# Create NVM's working directory if it doesn't exit
if [ ! -d "$HOME/.nvm" ]; then
        echo -e "${GREEN}Creating NVM directory...${NO_COLOR}"
        mkdir "$HOME/.nvm"
fi

# Add the NVM setup to the profile
echo -e "${GREEN}Configuring NVM in $ZPROFILE_PATH...${NO_COLOR}"
{
        echo 'export NVM_DIR="$HOME/.nvm"'
        echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm'
        echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion'
} >> "$ZPROFILE_PATH"

echo -e "${GREEN}Reloading shell profile...${NO_COLOR}"
source "$ZPROFILE_PATH"

# Install latest Node version
echo -e "${GREEN}Installing Node Latest LTS Version...${NO_COLOR}"
nvm install --lts

# Initialize miniconda
echo -e "${GREEN}Initializing miniconda...${NO_COLOR}"
conda init "$(basename "${SHELL}")"

if [ -z "$github_name" ]; then
        echo -e "${GREEN}Setting git global user.name...${NO_COLOR}"
        git config --global user.name "$github_name"
fi

if [ -z "$github_email" ]; then
        echo -e "${GREEN}Setting git global user.email...${NO_COLOR}"
        git config --global user.email "$github_email"
fi      

echo -e "${GREEN}Reloading shell profile...${NO_COLOR}"
source "$ZPROFILE_PATH"
        
echo -e "${GREEN}Cleaning up brew old versions...${NO_COLOR}"
brew cleanup

echo -e "${GREEN}Installing Docker...${NO_COLOR}"
curl -Lo Docker.dmg https://desktop.docker.com/mac/main/arm64/Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker
rm Docker.dmg

if [ ${#installed_apps[@]} -gt 0 ]; then
    echo -e "${GREEN}The following apps have been successfully installed:${NO_COLOR}"
    for app in "${installed_apps[@]}"; do
        echo -e "${GREEN}- $app${NO_COLOR}"
    done
else
    echo -e "${RED}No apps were successfully installed.${NO_COLOR}"
fi
        
