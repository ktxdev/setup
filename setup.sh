BLUE='\033[0;34m'
NC='\033[0m'

printf "${BLUE}Installing HomeBrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ktxdev/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

printf "${BLUE}Install Oh My Zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printf "${BLUE}Installing Oh My Zsh Theme Powerlevel10k ..."
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

printf "${BLUE}Installing Git ..."
brew install git

printf "${BLUE}Setting Git global configs ..."
git config --global user.name "Sean Huvaya"
git config --global user.email "sean.ktxdev@gmail.com"

printf "${BLUE}Installing Brave Browser ..."
brew install --cask brave-browser

printf "${BLUE}Installing Visual Studio Code ..."
brew install --cask visual-studio-code

printf "${BLUE}Installing Spotify ..."
brew install --cask spotify

printf "${BLUE}Installing Notion ..."
brew install --cask notion

printf "${BLUE}Installing iTerm2 ..."
brew install --cask iterm2

printf "${BLUE}Installing Rectangle ..."
brew install --cask rectangle

printf "${BLUE}Installing PyCharm ..."
brew install --cask pycharm

printf "${BLUE}Installing nvm ..."
brew install nvm
mkdir ~/.nvm
echo -e '\n# nvm\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
source ~/.zshrc

printf "${BLUE}Installing Node Latest LTS Version ..."
nvm install --lts

printf "${BLUE} Installing miniconda ..."
brew install --cask miniconda
conda init "$(basename "${SHELL}")"