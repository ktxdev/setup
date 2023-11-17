BLUE='\033[0;34m'
NC='\033[0m'

mac_os_setup() {
  printf "${BLUE}Installing HomeBrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (
    echo
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  ) >>/Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  printf "${BLUE}Installing Git ..."
  brew install git

  printf "${BLUE}Installing Intellij Idea ..."
  brew install --cask intellij-idea

  printf "${BLUE}Installing Android Studio ..."
  brew install --cask android-studio

  printf "${BLUE}Installing Visual Studio Code ..."
  brew install --cask visual-studio-code

  printf "${BLUE}Installing Brave Browser ..."
  brew install --cask brave-browser

  printf "${BLUE}Installing Postman ..."
  brew install --cask postman

  printf "${BLUE}Installing Slack ..."
  brew install --cask slack

  printf "${BLUE}Installing Spotify ..."
  brew install --cask spotify

  printf "${BLUE}Installing Bitwarden ..."
  brew install --cask bitwarden

  printf "${BLUE}Installing Notion ..."
  brew install --cask notion
  
  printf "${BLUE}Installing iTerm2 ..."
  brew install --cask iterm2

  printf "${BLUE}Installing Rectangle ..."
  brew install --cask rectangle

  printf "${BLUE}Installing Docker ..."
  brew install docker

  printf "${BLUE}Installing nvm ..."
  brew install nvm
  mkdir ~/.nvm
  echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >>/Users/$USER/.zshrc

  printf "${BLUE}Installing Node Latest LTS Version ..."
  nvm install --lts

  printf "${BLUE}Installing SDKMAN ..."
  curl -s "https://get.sdkman.io" | bash
  echo 'export SDKMAN_DIR="$HOME/.sdkman" [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> /Users/$USER/.zshrc

  printf "${BLUE}Installing Oracle Java 17.0.5 ..."
  sdk install java 17.0.5-oracle

  printf "${BLUE}Install Oh My Zsh ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  printf "${BLUE}Installing Oh My Zsh Theme Powerlevel10k .."
  brew install romkatv/powerlevel10k/powerlevel10k
  echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  mac_os_setup
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo "POSIX"
elif [[ "$OSTYPE" == "msys" ]]; then
  echo "msys"
elif [[ "$OSTYPE" == "win32" ]]; then
  echo "Windows 32"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo "Freebsd"
else
  echo "unknown"
fi
