set -x EDITOR vim
set -x LC_CTYPE "en_US.UTF-8"

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
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end
