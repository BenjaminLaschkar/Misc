# Personal IT tools 

# Installation :
```
cd ~
git clone git@github.com:BenjaminLaschkar/Misc.git
git clone https://github.com/BenjaminLaschkar/Misc.git
./Misc/scripts/init_computer.sh
```
You have also these options :
```
Options:
    -a, --install-all
        install all relevant package
    -d, --deploy-config
        deploy the configuration
    -h, --help
        display this help and exit
```
#### :warning: This script may interrupt after downloading zsh, you can CTRL+C to continue the install. <br>

##### :warning: It will overide your current .bash_aliases / .bashrc / .gitconfig / .git-prompt.sh / .minirc.dfl / .zshrc / .vimrc ! Please save them somewhere if they are important to you !

This script will install :

git, gitk, meld, terminator, ssh, zsh, powerline, fzf, vim, vim-gnome and python-pip

It will also apply a custom theme for oh-my-zsh and terminator

# Optionnal : set up git and a sshkey "password-free"

If you use a workspace define as /home/your_name/Workspace , you will need to change "your_name" in your home directory in .bash_aliase. <br>
If you use git, you will need to change your .gitconfig file manually to enter your username and mail. <br>
You can setup an sshkey that will always be valid due to the script sshkey.sh, you will need to modifiate the path and the password in this file.

# Improvement for the future / Cool thing to do :*

- Install virtualenv
- Add autokey from https://alternativeto.net/software/autokey-py3/about/
- Set up automatically this project : https://github.com/dbaty/testfinder (install go + place it in /usr/local/ + set up $GOPATH + place testfinder in /usr/local/go/bin/ 
+ add this in .zshrc
```
_fzf_complete_pytest() {
    _fzf_complete "--multi --reverse" "$@" < <(testfinder)
}
```
