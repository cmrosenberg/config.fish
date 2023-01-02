set -x EDITOR vim

set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"


# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate ' dirty'
set __fish_git_prompt_char_stagedstate ' staged'
set __fish_git_prompt_char_stashstate ' stashed'
set __fish_git_prompt_char_upstream_ahead ' ahead'
set __fish_git_prompt_char_upstream_behind ' behind'

set fish_greeting

function jr
        cd (git rev-parse --show-toplevel)
end

function gap
        git add -p
end


function gpo
        git push origin (git branch --show-current)
end

function gpof
        git push origin (git branch --show-current) --force-with-lease
end

function gc
        git commit
end

function gs
        git status
end

function fish_prompt
        if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
        end
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end

function br
    set -l cmd_file (mktemp)
    if broot --outcmd $cmd_file $argv
        read --local --null cmd < $cmd_file
        rm -f $cmd_file
        eval $cmd
    else
        set -l code $status
        rm -f $cmd_file
        return $code
    end
end




alias bim=vim
alias d=docker
alias docker-compose="docker compose"
alias eit=exit
alias exiyt=exit
alias exti=exit
alias exyit=exit
alias fetch="git fetch origin"
alias g=git
alias gi=git
alias gita=git
alias gp="git pull --ff-only"
alias gt=git
alias gti=git
alias ivm=vim
alias lls=ls
alias p=python3
alias pull="git pull --ff-only"
alias rebott=reboot
alias sl=ls
alias tg=tig
alias v=vim


if test -G ~/.config/fish/config.fish.local
    source ~/.config/fish/config.fish.local
end
