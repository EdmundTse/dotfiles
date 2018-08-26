# dotfiles

This is a set of unix configuration files originally from James Bunton at https://delx.net.au/.

## Basic setup

```
git clone https://github.com/EdmundTse/dotfiles.git .dotfiles
```


Make a backup of any existing files:
```
cd
mkdir -p backup
mv .bash .bash_profile .bashrc .gitconfig .inputrc .pythonrc.py .screenrc .vimrc backup/
```


Symlink the config files into your home directory:
```
ln -sf ~/.dotfiles/{.bash,.bash_profile,.bashrc,.gitconfig,.inputrc,.pythonrc.py,.screenrc,.vimrc} ~/
ln -sf ~/.dotfiles/.gitignore_global ~/.gitignore
ln -sf ~/.dotfiles/.ssh/config ~/.ssh/
```


Symlink the git hooks
```
cd ~/.dotfiles/.git/
rm -rf hooks
ln -s ../git-hooks hooks
```
