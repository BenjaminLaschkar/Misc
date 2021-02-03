# Git alias
alias git-gerrit-hook='scp -P 29418 gerrit.parrot.biz:hooks/commit-msg .git/hooks'
alias gk='gitk --all --date-order &'
alias gl="git log -10 --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gc="git commit -m \"[DEV]"
alias glost="git fsck --lost-found"
alias gfa="git fetch --all"
alias gs="git status"
alias clear_tags="git tag -l | xargs git tag -d && git fetch --tags"

gt() {
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --header "Press CTRL-S to toggle sort" --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | head -$LINES'" --bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
}
alias resetAllRepo="repo forall -c \"git reset --hard ; git clean -fdx\""

# Useful directory
WORKSPACE="/home/benjamin/Workspace" # WARN-USER Change benjamin if something else
alias wp='cd ${WORKSPACE}'

# source home files
alias src-p='source ~/.profile'
alias src-ba='source ~/.bash_aliases'
alias src-br='source ~/.bashrc'
alias src-z='source ~/.zshrc'
alias rmknownhosts='rm ~/.ssh/known_hosts'
alias logcat="adb -s ${TARGET} logcat -v color"

# adb path of package
packagepath() {
	adb -s ${TARGET} shell pm path $1
}

adiprobot() {
   sudo ip route add 192.168.1.$1 dev wlp3s0
}

# adb version of apk
version() {
	adb shell dumpsys package $1 | grep versionName | cut -d= -f2
}

# adb list packages
alias listpackage="adb -s ${TARGET} shell 'pm list packages -f' | sed -e 's/.*=//' | sort"

# launch shell
alias targetshell="adb -s ${TARGET} shell"

# List current services
alias listservice="adb -s ${TARGET} shell dumpsys activity services"

# find a text in file
dirfind(){
	grep -rnw '.' -e $1
}

# Gradle command
alias gar="./gradlew assembleRelease"
alias gad="./gradlew assembleDebug"

# personal command
alias xo=xdg-open
alias .="source"

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'

find_in_all_files(){
	find -name "$1" -exec grep --color -rHnwe "$2" {} \;
}

alias reboot="echo NO REBOOT !"
alias studio="/opt/android-studio/bin/studio.sh"

# SOFTBANK COMMAND

alias installPackage="echo 'qicli call PackageManager.install /home/nao/' | xclip"
alias changePassword="echo 'qicli call ALSystem.changePassword nao pepper' | xclip"
alias deletetoken="echo 'rm ~/.local/share/naoqi/qi.p*' | xclip"
alias autoflash="echo 'nao-autoflash --erase-user-data x' | xclip"
alias logdialog="echo 'journalctl -f -a -t dialog.Conversation -t dialog.dialog -t audio.Audio --output=short-precise' | xclip"
alias checkpkgdialog="echo 'cat .local/share/PackageManager/apps/dialog/manifest.xml' | xclip"
alias stopfocus="echo 'qicli call ALAutonomousLife.stopFocus' | xclip"
ROBOT_IP="10.0.160.40"

sendToRobot(){
  scp $1 nao@$ROBOT_IP:
}

switchIP(){
  if [ $ROBOT_IP = "10.0.160.40" ];
  then
    ROBOT_IP="192.168.1.55"
  else
    ROBOT_IP="10.0.160.40"
  fi
  echo $ROBOT_IP
}

conn(){
  adiprobot $1
  adb connect 192.168.1.$1
}

changerobotadress(){
  ROBOT_IP=$1
}
alias td='cd ${WORKSPACE} ; cd testsuite-python-dialog/dialog_suite ; mkvirtualenv dialog > /dev/null '
