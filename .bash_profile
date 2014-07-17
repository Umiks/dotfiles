PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=":/usr/local/mysql/support-files:/usr/local/mysql/bin:$PATH"
PATH="$HOME/serp-tools:$PATH"

#git autocomplete
source ~/dotfiles/git-completion.bash

alias ssh="ssh -A"
alias ssl="ssh leon13.yandex.ru"
alias ssk="ssh kitty.serp.yandex.ru"
alias sss="ssh simf.serp.yandex.ru"
alias vi="vim"
alias l="ls"
alias la="ls -la"
alias cdp="cd pages-desktop/search/all"
alias tdp="cd pages-touch-phone/search/all"
alias vp="vim pages-desktop/search/all/_all.priv.js"
alias vtp="vim pages-touch-phone/search/all/_all.priv.js"
alias cdb="cd ../../.."
alias bup=". ~/.bash_profile"
alias sedit="vim ~/.vim/snippets/javascript/javascript.snippets"
alias vedit="vim ~/.vimrc"
alias bedit="vim ~/.bash_profile"
alias branchRebase="git fetch --all && git rebase upstream/dev"
alias betaRebase="branchRebase"
alias makeFork="git remote rename origin upstream && git remote add origin git@github.yandex-team.ru:evgenjion/web3.git"
alias makeWorkCopy="/hol/arkanavt/report/scripts/dev/yreport -e development"

# Про сборку
alias fdx="git clean -fdx && gmake -Bj10"
alias gtest="gmake priv-test"
alias emake="enb make"

if [[ `which gmake` != '' ]]; then
    alias make='gmake'
else
    alias gmake='make'
fi


# git aliases
alias g="git"
alias gb="git branch"
alias gbr="gb"
alias gdh="git diff HEAD~"
alias gco="git checkout"
alias gcob="git chechout -b"
alias gst="git status"
alias glol="git lol"
alias gdiff="git diff"
alias gadd="git add"

unset LC_ALL
export LANG=C
export LC_CTYPE="ru_RU.UTF-8"
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="ru_RU.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"

function log() {
    local wcName=${1-`pwd`} # первый параметр, либо путь к текущей дирректории
    local username=`whoami`

    wcName=`sed "s/.*\($username\)\/\(.\{1,\}\)\/.*/\2/g" <<< "$wcName"` # вырезаем имя рабочей копии из пути

    local domain=${2-'ru'}
    betaPath="/var/tmp/$username-d-$wcName.simf.serp.yandex.$domain.log"

    echo "logging $betaPath..."
    tail -f $betaPath #смотрим логи
}

function up() {
    local fileList=`git status -s`
    echo $fileList
}

function build() {
    cd "report/templates/YxWeb"
    gmake -f "$1.mk"
    cd "../../.."
    ln -s "report/templates/YxWeb/$1"
}

function rebuild() {
    projectName=$1
    if [ -z $1 ]; then
        projectName="web3"
    else
        projectName="$1"
    fi
    echo "removing $projectName..."
    rm -rf "$projectName/" # удаляем сам проект
    rm "$projectName" # удаляем ссылку на него
    echo "building $projectName..."
    build "$projectName"
}

# функция для работы с проектами
function prj() {
    local _cmd=$1
    local _projectName=${2-'web3'}

    if [[ $_cmd = "rm" ]]; then
        echo "removing $_projectName..."
        rm -rf "$_projectName/" && rm "$_projectName" # удаляем проект и симлинку
    elif [[ $_cmd = "build" ]]; then
        echo "building $_projectName..."
        build $_projectName
    elif [[ $_cmd = "change" ]]; then

        echo $3
        if [[ -z $3 ]]; then
            echo "cannot change without 3 parameter"
            echo "usage: prj change web_touch_phone web3"
        else
            prj rm "$_projectName" && prj build $3
        fi
    elif [[ $_cmd = "rebuild" ]]; then
        rebuild $_projectName
    fi
}


#source ~/.dotfiles/.bash_profile

# tanker-kit completion. Use in conjunction with tanker-cli or global tanker-kit
_tanker_completion() {
    TANKERCOMP="$(tanker comp -c "${COMP_LINE}" -p "${COMP_CWORD}" 2> /dev/null)"
    COMPREPLY=($(IFS=$'\n' compgen -W "${TANKERCOMP}" -- "${COMP_WORDS[COMP_CWORD]}"))
}

complete -o default -F _tanker_completion tanker
# ------------------------------------------------------------------------------
