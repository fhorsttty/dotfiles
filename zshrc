## カラーリング
autoload -Uz colors; colors     # カラーリングする。
PROMPT="%{${fg[magenta]}%}%B%n@%m%b%f:%{${fg[yellow]}%}%B%c%b%f$ "    # username@hostname:directory
eval "$(dircolors -b ~/.config/dircolors-solarized/dircolors.ansi-universal)"
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


## キーバインド
bindkey -e                            # emacs風キーバインドを採用
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^u' backward-kill-line
autoload -Uz select-word-style        # 単語の区切り文字を指定する。
select-word-style default
zstyle ':zle:*' word-chars " /:@,|"   # Ctrl-wで区切り文字ごとに文字列を削除できる。
zstyle ':zle:*' word-style unspecified 


## 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
setopt hist_ignore_all_dups   # 重複するコマンドは履歴に登録しない。
setopt hist_ignore_space      # 空白から始まるコマンドは履歴に登録しない。
setopt hist_reduce_blanks     # 履歴に登録するときに余分な空白を削除する。
setopt extended_history       # 時刻も一緒に記録する。
setopt share_history          # zshプロセス間で履歴を共有する。
setopt hist_no_store          # historyコマンドを履歴に登録しない。
setopt hist_verify            # 履歴を呼び出して、編集後に実行する。
setopt list_types             # 補完候補の一覧でファイルの種別をマークで表示する。
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^S' history-incremental-pattern-search-forward
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
zle -N peco-select-history
bindkey '^R' peco-select-history


## 補完
autoload -Uz compinit; compinit   # 補完機能を有効にする。
LISTMAX=1000                      # 補完候補が1000を越えるときは無視する。
setopt complete_in_word       # カーソル位置が単語の途中でも補完する。
setopt always_last_prompt     # 補補完了時に補完候補の一覧を画面から消す。
setopt mark_dirs              # ディレクトリの末尾に'/'を付ける。
setopt auto_menu              # 補完キーを連続入力すると、順に補完候補を自動で補完する。
setopt auto_param_keys        # 括弧を自動で保管する。
setopt magic_equal_subst      # オプションのイコール(--opt=)以降も補完する。
setopt equals
setopt correct                # コマンドのスペルミスを訂正する。
setopt always_last_prompt     # カーソルの位置を保持したままファイル名一覧を表示する。
setopt auto_param_slash       # ディレクトリ名の補完で末尾に'/'を付加する。
setopt auto_list              # 補完候補の一覧を表示する。
setopt list_packed            # 補完候補を詰めて表示する。
setopt extended_glob          # ワイルドカードの展開をする。
setopt globdots
unsetopt promptcr             # 文字列末尾に改行コードを付加する。
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
# 大文字／小文字を区別せずに補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# tabキーで補完候補を選択できるメニューを表示する。
zstyle ':completion:*:default' menu select = 1
# '../'の末尾ではカレント・ディレクトリを補完しない。
zstyle ':completion:*' ignore-parents parent pwd ..
# psコマンドでプロセス名を保管する。
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"


## other options
umask 022
export EDITOR=vim
export LANG=en_US.UTF-8
unsetopt ignore_eof           # Ctrl-Dでログアウトしない。
setopt no_flow_control        # フロー制御(Ctrl-S || Ctrl-Q)を無効にする。
setopt interactive_comments   # コマンドライン上の'#'以降をコメントとみなす。
setopt print_eight_bit        # 日本語ファイル名を表示する。
setopt no_beep                # ビープ音を鳴らさない。
setopt nolistbeep
setopt auto_resume            # サスペンド中のプロセスと同名のコマンドを実行するとレジュームする。
setopt notify                 # フォアグラウンド・ジョブの状態を通知する。
setopt no_tify                # バックグラウンド・ジョブの終了を通知する。
setopt no_clobber             # リダイレクト先のファイルが存在する場合はエラー終了する。


## tmux rename-window
autoload -Uz add-zsh-hook

function rename-tmux-window() {
  if [ $TERM = "screen" ]; then
    current_dir=$(pwd | sed -e s/\ /_/g | xargs -i basename {})
    tmux rename-window $current_dir
  fi
}
add-zsh-hook precmd rename-tmux-window


## ディレクトリ移動
setopt auto_cd                # ディレクトリ名だけで移動する。
setopt auto_pushd       
setopt pushd_ignore_dups      # 重複するディレクトリはスタックに登録しない。
setopt pushd_silent


## コマンドの別名
alias bd='popd > /dev/null'
alias l='ls -Flh --color=auto'
alias ll='ls -FlhA --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color-auto'
alias vi='vim'
