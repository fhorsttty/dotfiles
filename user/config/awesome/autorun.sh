#!/usr/bin/env bash

# prerequisite packages
# apt-get install xautolock lightdm light-locker

function run {
  if ! pgrep $1 ;
  then
    "$@"&
  fi
}

run xautolock -detectsleep \
  -time 60 \
  -locker "light-locker-command -l" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
