#####################
# Personal IT tools #
#####################

# Clone the repo
> git clone git@github.com:BenjaminLaschkar/Misc.git
or 
> git clone https://github.com/BenjaminLaschkar/Misc.git

# If you want to launch the init computer script :
cd ~ 
./Misc/scripts/init_computer.sh

*WARNING :* This script may interrupt after downloading zsh, you can CTRL+C to continue the install.
*WARNING :* It will overide your current .bash_aliases / .bashrc / .gitconfig / .git-prompt.sh / .minirc.dfl / .zshrc / .vimrc ! Please save them somewhere if they are important to you !

This script will install :

git, gitk, meld, terminator, ssh, zsh, powerline, fzf, vim, vim-gnome and python-pip

It will also apply a custom theme for oh-my-zsh and terminator

# Setup 
You will need to change once your .gitconfig file manually to enter your password.
You can setup an sshkey that will always be valid due to the script sshkey.sh, you will need to modifiate the path in this file.

*Improvement for the future / Cool thing to do :*

- Install virtualenv
- Set up automatically this project : https://github.com/dbaty/testfinder (install go + place it in /usr/local/ + set up $GOPATH + place testfinder in /usr/local/go/bin/ + add this in .zshrc

```
_fzf_complete_pytest() {
    _fzf_complete "--multi --reverse" "$@" < <(testfinder)
}
```
