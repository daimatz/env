export LANG=ja_JP.UTF-8
source ~/.zsh/init.zsh

if [ -z "`psg .ntpd.sh`" ]; then nohup bash ~/.ntpd.sh &> /dev/null &; fi

export GOROOT=~/.goroot
export GOPATH=~

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
