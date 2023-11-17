mac_os_setup() {
  echo "Installing HomeBrew ..."
  sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (
    echo
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  ) >>/Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  echo "Installing Git ..."
  brew install git

  echo "Installing Intellij Idea ..."
  brew install --cask intellij-idea

  echo "Installing Android Studio ..."
  brew install --cask android-studio

  echo "Installing Visual Studio Code ..."
  brew install --cask visual-studio-code

  echo "Installing Brave Browser ..."
  brew install --cask brave-browser

  echo "Installing Postman ..."
  brew install --cask postman

  echo "Installing Slack ..."
  brew install --cask slack

  echo "Installing Spotify ..."
  brew install --cask spotify

  echo "Installing Bitwarden ..."
  brew install --cask bitwarden

  echo "Installing Notion ..."
  brew install --cask notion
  
  echo "Installing iTerm2 ..."
  brew install --cask iterm2

  echo "Installing Rectangle ..."
  brew install --cask rectangle

  echo "Installing nvm ..."
  brew install nvm
  mkdir ~/.nvm
  echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >>/Users/$USER/.zshrc

  echo "Installing Node Latest LTS Version ..."
  nvm install --lts

  echo "Installing SDKMAN ..."
  curl -s "https://get.sdkman.io" | bash
  echo 'export SDKMAN_DIR="$HOME/.sdkman" [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> /Users/$USER/.zshrc

  echo "Installing Oracle Java 17.0.5 ..."
  sdk install java 17.0.5-oracle

  echo "Install Oh My Zsh ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Installing Oh My Zsh Theme Powerlevel10k .."
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
