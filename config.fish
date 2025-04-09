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

if test -G ~/.config/fish/config.fish.local
    source ~/.config/fish/config.fish.local
end
