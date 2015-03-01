export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
source ~/.zsh/init.zsh
export GOROOT=~/.goroot
export GOPATH=~

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[[ ! -z "`psg .ntp.sh`" ]] && nohup bash .ntpd.sh &> /dev/null &
