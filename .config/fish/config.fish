if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim 

abbr gf "git fetch"
abbr gb "git branch"
abbr gp "git pull"
abbr gco "git checkout"
abbr ga "git add"
abbr ggf "git grep -F -n -w" # string search
abbr ggp "git grep -P -n -w" # perl-regex search
alias gs "git status"
alias gl "git log"
alias gd "git diff"
alias gca "git commit -a"
alias gfp "git fetch --prune"
alias gov "git for-each-ref --sort=-committerdate refs/remotes/origin/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

abbr xq "xbps-query -Rs"
abbr xi "sudo xbps-install -Su"
abbr xr "sudo xbps-remove -R"
abbr xl "xbps-query -l | awk '{ print $2 }' | xargs xbps-uhelper getpkgname"

fish_add_path ~/.bin
ls ~/.bin