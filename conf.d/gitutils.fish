function jr
        cd (git rev-parse --show-toplevel)
end

function gpo
        git push origin (git branch --show-current)
end

function gpof
        git push origin (git branch --show-current) --force-with-lease
end


function gs
        git status --untracked-files=no
end

function gsu
        git status
end
