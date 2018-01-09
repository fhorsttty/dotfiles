#---------------------------------------
# plugins
#---------------------------------------
[[ -f $HOME/.zplug/init.zsh ]] || return

source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
  printf "- zplug: install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load #--verbose

#---------------------------------------
# environment
#---------------------------------------
umask 022
export EDITOR=vim
export LANG=en_US.UTF-8
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'    # 単語の区切りと判定されない文字

#---------------------------------------
# coloring
#---------------------------------------
autoload -Uz colors; colors
PROMPT="%{${fg[magenta]}%}%B%n@%m%b%f:%{${fg[yellow]}%}%B%c%b%f$ "    # username@hostname:directory$
#SPROMPT="${fg[magenta]}%}maybe%f => '${fg[magenta]}%}%r%f'? [${fg[yellow]}%}%BN%b%f/${fg[magenta]}%}y%f/a/e] "
SPROMPT="maybe => '${fg[magenta]}%}%r%f'? [${fg[yellow]}%}%BN%b%f/${fg[magenta]}%}y%f/a/e] "
eval "$(dircolors -b ~/.config/dircolors-solarized/dircolors.ansi-universal)"
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# git
autoload -Uz vcs_info
setopt prompt_subst                     # プロンプト変数内での変数展開する。      
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }                  # プロンプト表示直前にvcs_infoを呼び出す。
#RPROMPT="%{${fg[blue]}%}[%~]%f"
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#---------------------------------------
# keybinds
#---------------------------------------
bindkey -e                               # emacs風キーバインドを採用
bindkey '^U' backward-kill-line

#autoload -Uz select-word-style          # 単語の区切り文字を指定する。
#select-word-style default
#zstyle ':zle:*' word-chars " _-/:@,|"   # Ctrl-wで区切り文字ごとに文字列を削除できる。
#zstyle ':zle:*' word-style unspecified 

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^S' history-incremental-pattern-search-forward
zle -N peco-select-history
bindkey '^R' peco-select-history

zmodload zsh/complist
bindkey -M menuselect '^G' .send-break                          # send-break２回分
bindkey -M menuselect '^I' forward-char                         # １つ右の補完候補へ
bindkey -M menuselect '^J' .accept-line                         # accept-line２回分
bindkey -M menuselect '^K' accept-and-infer-next-history        # 次の補完メニューを表示
bindkey -M menuselect '^P' up-line-or-history                   # １つ上の補完候補へ
bindkey -M menuselect '^N' down-line-or-history                 # １つ下の補完候補へ
bindkey -M menuselect '^R' history-incremental-pattern-forward  # １つ下の補完候補へ

zle -N peco-cdr
bindkey '^[r' peco-cdr

#---------------------------------------
# history
#---------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
setopt hist_ignore_all_dups       # 重複するコマンドは履歴に登録しない。
setopt hist_ignore_space          # 空白から始まるコマンドは履歴に登録しない。
setopt hist_reduce_blanks         # 履歴に登録するときに余分な空白を削除する。
setopt extended_history           # 時刻も一緒に記録する。
setopt share_history              # zshプロセス間で履歴を共有する。
setopt hist_no_store              # historyコマンドを履歴に登録しない。
setopt hist_verify                # 履歴を呼び出して、編集後に実行する。
setopt list_types                 # 補完候補の一覧でファイルの種別をマークで表示する。

#---------------------------------------
# completion
#---------------------------------------
autoload -Uz compinit; compinit   # 補完機能を有効にする。
LISTMAX=1000                      # 補完候補が1000を越えるときは無視する。
setopt complete_in_word           # カーソル位置が単語の途中でも補完する。
setopt always_last_prompt         # 補補完了時に補完候補の一覧を画面から消す。
setopt mark_dirs                  # ディレクトリの末尾に'/'を付ける。
setopt auto_menu                  # 補完キーを連続入力すると、順に補完候補を自動で補完する。
setopt auto_param_keys            # 括弧を自動で保管する。
setopt magic_equal_subst          # オプションのイコール(--opt=)以降も補完する。
setopt equals
setopt correct                    # コマンドのスペルミスを訂正する。
setopt always_last_prompt         # カーソルの位置を保持したままファイル名一覧を表示する。
setopt auto_param_slash           # ディレクトリ名の補完で末尾に'/'を付加する。
setopt auto_list                  # 補完候補の一覧を表示する。
setopt list_packed                # 補完候補を詰めて表示する。
setopt extended_glob              # ワイルドカードの展開をする。
setopt globdots
unsetopt promptcr                 # 文字列末尾に改行コードを付加する。
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' menu select interactive
setopt menu_complete
# 大文字／小文字を区別せずに補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# tabキーで補完候補を選択できるメニューを表示する。
zstyle ':completion:*:default' menu select = 1
# '../'の末尾ではカレント・ディレクトリを補完しない。
zstyle ':completion:*' ignore-parents parent pwd ..
# psコマンドでプロセス名を保管する。
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"
# 補完候補とその説明の区切り文字を指定する。
zstyle ':completion:*' list-separator '=>'

#---------------------------------------
# other options
#---------------------------------------
autoload -Uz is-at-least
if is-at-least 4.3.11; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi
setopt auto_cd                    # ディレクトリ名だけで移動する。
setopt auto_pushd       
setopt pushd_ignore_dups          # 重複するディレクトリはスタックに登録しない。
setopt pushd_silent

unsetopt ignore_eof               # Ctrl-Dでログアウトしない。
setopt no_flow_control            # フロー制御(Ctrl-S || Ctrl-Q)を無効にする。
setopt interactive_comments       # コマンドライン上の'#'以降をコメントとみなす。
setopt print_eight_bit            # 日本語ファイル名を表示する。
setopt no_beep                    # ビープ音を鳴らさない。
setopt nolistbeep
setopt auto_resume                # サスペンド中のプロセスと同名のコマンドを実行するとレジュームする。
setopt notify                     # フォアグラウンド・ジョブの状態を通知する。
setopt no_tify                    # バックグラウンド・ジョブの終了を通知する。
setopt no_clobber                 # リダイレクト先のファイルが存在する場合はエラー終了する。

autoload -Uz add-zsh-hook
add-zsh-hook precmd rename-tmux-window

#---------------------------------------
# functions
#---------------------------------------
function rename-tmux-window() {
  if [ $TERM = "screen" ]; then
    current_dir=$(pwd | sed -e s/\ /_/g | xargs -i basename {})
    tmux rename-window $current_dir
  fi
}

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac='tac'
  else
    tac='tail -r'
  fi
  BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}

function peco-cdr() {
  local recent_dirs="$(cdr -l | sed -e 's/^[0-9]\+ \+//' | peco)"
  if [ -n "$recent_dirs" ]; then
    BUFFER="cd ${recent_dirs}"
    zle accept-line
  fi
  zle clear-screen
}

#---------------------------------------
# command alias
#---------------------------------------
alias vi='vim'
alias bd='popd > /dev/null'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias l='ls -F $LS_OPTIONS'
alias ll='ls -Flh $LS_OPTIONS'
#alias L='ls -Flhr $LS_OPTIONS'
alias la='ls -FlhA $LS_OPTIONS'
alias grep='grep $LS_OPTIONS'

#---------------------------------------
# development
#---------------------------------------
#export EDITOR=/usr/bin/vim
export EDITOR=/usr/local/bin/vim
eval "$(direnv hook zsh)"
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"
