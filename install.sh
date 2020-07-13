backupdir=~/Desktop/backup_dotfiles

#Create backups
mkdir -p $backupdir

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# ZSH
cp ~/.zshrc $backupdir
rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

#need to install zsh-syntax-highlighting manually
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp ~/.p10k.zsh $backupdir
rm ~/.p10k.zsh
ln -s ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh

# VIM
cp ~/.vimrc $backupdir
rm ~/.vimrc 
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
mkdir ~/.vim/plugged
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
