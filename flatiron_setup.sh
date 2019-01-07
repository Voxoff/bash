#!/usr/bin/env bash

#we need sudo for all this? 


#must be a way to do this w/o popups
xcode-select --install

echo "you now have xcode :)"
#homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "you now have homebrew"

# general brew packages
function install_or_upgrade { brew ls | grep $1 > /dev/null; if (($? == 0)); then brew upgrade $1; else brew install $1; fi }
install_or_upgrade "git"
install_or_upgrade "wget"
install_or_upgrade "imagemagick"
install_or_upgrade "jq"
install_or_upgrade "openssl"
install_or_upgrade "gmp"
install_or_upgrade "gnupg"
install_or_upgrade "sqlite3"
echo "you now have homebrew level 2"

# if  Warning: gnupg-1.4.19 run brew link gnupg


#lets have some rvm fun
curl -sSL https://get.rvm.io | bash

# work around so you dont have to close and reopen terminal
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  . "$HOME/.rvm/scripts/rvm"
else
  echo "$HOME/.rvm/scripts/rvm" could not be found.
  exit 1
fi

export PATH="$PATH:$HOME/.rvm/bin"

echo "you now have rvm (that's ruby version manager)"

# To void the OpenSSL dependency error
# rwm use 2.3.3 --default --install
rvm use 2.5.3 --default --install

echo "you now have ruby 2.5.3. Yay!"

# we love gems.
gem update --system
gem install learn-co bundler json rspec pry pry-byebug nokogiri hub thin shotgun rack hotloader rails sinatra activeadmin sidekiq pundit --no-rdocs

echo "you now have ruby with gems!!"

#learn setup 
learn whoami

echo "learn me some test"
#atom via cask - acceptable?
brew install caskroom/cask/brew-cask 2> /dev/null
brew cask install atom

echo "Atomified." 

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.bash_profile
source ~/.bash_profile

nvm install node
nvm use node
nvm alias default node




