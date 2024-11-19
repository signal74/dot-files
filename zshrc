# ========= ZSH OPTIONS =========
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt INC_APPEND_HISTORY     # History updated immediately
setopt APPEND_HISTORY         # Ensure all commands are appended to the history file.
setopt EXTENDED_HISTORY       # Save timestamp and duration of command in history
setopt HIST_IGNORE_SPACE

# ========= ZSH PLUGINS =========
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# ========= STANDARD ALIASES =========
alias ll='ls -lah --color=always'
alias ls='ls -l --color=always'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vim='nvim'
alias dusort='du -h -d 1 | perl -e '"'"'sub h{%h=(K=>10,M=>20,G=>30);($n,$u)=shift=~/([0-9.]+)(\D)/;return $n*2**$h{$u}}print sort{h($b)<=>h($a)}<>;'"'"''
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# ========= HUBKIT ALIASES =========
# Serve files in current directory over nginx
alias nginx-here='docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/srv/data" rflathers/nginxserve'
# Serve files in current dir from a WebDAV container
alias webdav-here='docker run --rm -it -p 80:80 -v "${PWD}:/srv/data/share" rflathers/webdav'
# To have persistence, create a local ~/.msf4 directory to be mounted as volume
alias metasploit='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" metasploitframework/metasploit-framework ./msfconsole'
# Same as above, but expose ports for serving files or catching shells
alias metasploit-ports='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -p 8443-8500:8443-8500 metasploitframework/metasploit-framework ./msfconsole'
# Generate payload with msfvenom
alias msfvenom-here='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom'
# Start a server that will echo out any HTTP requests it receives
alias req-dumper='docker run --rm -it -p 80:3000 rflathers/reqdump'
# Start a server that will write all post requests it receives to a file in mounted volume
alias post-dumper='docker run --rm -it -p80:3000 -v "${PWD}:/data" rflathers/postfiledump'

# ========= EXPORTS =========
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:${HOME}/.cargo/bin"
export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"

export PS1="
%{%F{39}%}%n %{%F{226}%}%1~
%{%f%}$ "
