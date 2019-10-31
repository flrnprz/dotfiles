set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x GIT_EDITOR $EDITOR
set -x PAGER "less"
set -x FZF_DEFAULT_COMMAND "fdfind --type f --follow --hidden --exclude .git --exclude node_modules"
set -x BAT_THEME "OneHalfDark"

# go support
if test -e /usr/local/go/
  set -x GOPATH $HOME/go $GOPATH
  set PATH $GOPATH/bin $PATH
end

if test -e ~/go/bin
  set PATH ~/go/bin $PATH
end

# Haskell stack and others
if test -e ~/.local/bin
  set PATH ~/.local/bin $PATH
end

# needed for emacs doom
if test -e ~/.emacs.d/bin
   set PATH ~/.emacs.d/bin $PATH
end

# Yarn
if test -e ~/.yarn/bin
  set PATH ~/.yarn/bin $PATH
end

# Alias's to modified commands
alias cp 'cp -i'
alias cat 'bat'
alias mv 'mv -i'
alias rm 'rm -iv'
alias rmf 'rm -ivrf'
alias mkdir 'mkdir -p'
alias ps 'ps auxf'
alias less 'less -R'
alias vi 'nvim'
alias svi 'sudo nvim'
alias vis 'nvim "+set si"'

#directories
alias home 'cd ~'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd../../..'

# Alias's for multiple directory listing commands
alias la 'ls -Alh' # show hidden files
alias ls 'ls -aFh --color=always' # add colors and file type extensions
alias lx 'ls -lXBh' # sort by extension
alias lk 'ls -lSrh' # sort by size
alias lc 'ls -lcrh' # sort by change time
alias lu 'ls -lurh' # sort by access time
alias lr 'ls -lRh' # recursive ls
alias lt 'ls -ltrh' # sort by date
alias lm 'ls -alh |more' # pipe through 'more'
alias lw 'ls -xAh' # wide listing format
alias ll 'ls -Fls' # long listing format
alias labc 'ls -lap' #alphabetical sort
alias lf "ls -l | egrep -v '^d'" # files only
alias ldir "ls -l | egrep '^d'" # directories only
#alias genpass
# fd-find
alias fd 'fdfind'

# mpv filters
alias mpv 'mpv --af="acompressor=ratio=4,loudnorm"'
alias mpv-drc 'mpv --af="acompressor=ratio=4,loudnorm"'
alias mpv-nm 'mpv --af=lavfi=[pan="stereo|FL=FC+0.30*FL+0.30*FLC+0.30*BL+0.30*SL+0.60*LFE|FR=FC+0.30*FR+0.30*FRC+0.30*BR+0.30*SR+0.60*LFE"]'
alias mpv-nm-drc 'mpv --af=lavfi=[pan="stereo|FL=FC+0.30*FL+0.30*FLC+0.30*BL+0.30*SL+0.60*LFE|FR=FC+0.30*FR+0.30*FRC+0.30*BR+0.30*SR+0.60*LFE,loudnorm"]'

# Abbreviations
abbr em "emacs"
abbr nv "nvim"
abbr ga "git add"
abbr gcb "git checkout -b"
abbr gm "git commit -m"
abbr gp "git push"
abbr gpoh "git push -u origin HEAD"
abbr gs "git status -s"

#prompt
source ~/.config/fish/functions/prompt.fish

#gpaste-client
if test -x (command -v gpaste-client)
  alias gpasteg='gpaste-client get'
  alias gpastes='gpaste-client select'
  alias gpastel='gpaste-client | less'
end

source ~/.asdf/asdf.fish
#thefuck --alias | source
#starship init fish | source

