sudo apt-get update && upgrade

ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -C $USER

sudo apt install git

git config --global user.name "Simon Scholz"
git config --global user.email simon.scholz@vogella.com

git config --global branch.autosetuprebase always

git config --global gpg.program gpg
git config --global commit.gpgsign true

echo "Please also configure: git config --global user.signingkey {your gpg signing key}"

mkdir ~/git/vogella

mkdir ~/git/eclipse

mkdir ~/git/vogella

sudo apt install shutter

echo "Remember to fix shutter edit: https://itsfoss.com/shutter-edit-button-disabled/"

sudo apt install sdkman

source "~/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.191-oracle

sudo ln -t /usr/bin -s ~/.sdkman/candidates/java/current/bin/javac javac
sudo ln -t /usr/bin -s ~/.sdkman/candidates/java/current/bin/java java

sdk install gradle

sdk install maven

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm install node

npm install -g @dojo/cli

npm install -g @dojo/cli-create-app

sudo apt install filezilla

sudo apt install keepassx

sudo apt install python-pip

sudo pip install youtube-dl

sudo pip install --upgrade youtube-dl

mkdir ~/eclipse

mkdir ~/workspaces

sudo apt-get update && upgrade

echo "Done automatic console installs"

echo "Do not forget about Dropbox, Skype, TeamViewer, Slack, VS Code, Chrome and of course download Eclipse"

