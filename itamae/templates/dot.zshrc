export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
source ~/.zsh/init.zsh
export GOROOT=~/.goroot
export GOPATH=~

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.nodebrew/current/bin

[[ ! -z "`psg .ntp.sh`" ]] && nohup bash .ntpd.sh &> /dev/null &
function pbcopy() { cat /dev/stdin > /vagrant/.copyfile }

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi
