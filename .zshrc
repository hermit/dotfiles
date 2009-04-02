PS1='%B%#%b '
#RPS1='%B%~%b'

# (cdした時だけならchpwdでいいが、sshの終了時にも更新したいのでprecmd)
precmd () { print -Pn '\e]2;%m:%~\a' }
precmd

alias a=alias d='ls -AlFBG --color=tty --show-control-chars' h=history
a j='jobs -l' l=less m=make mv='mv -i' pd=popd q=exit t=which
a cp='cp -ip' rsync='rsync -a' scp='scp -p'

setopt auto_cd auto_pushd correct ignore_eof list_packed
# print_eight_bit

HISTFILE=~/var/zsh_history
HISTSIZE=999999
SAVEHIST=999999
setopt hist_ignore_all_dups hist_ignore_dups hist_no_store hist_reduce_blanks hist_save_nodups share_history

export RUBYLIB=$HOME/src/ruby-progressbar-0.9

autoload -U compinit
compinit
