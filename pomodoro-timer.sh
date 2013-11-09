#!/bin/sh
# by Jakukyo Friel <weakish@gmail.com> and licensed under Apache v2.

# A simple pomodoro timer.

# Depends
#
# - libnotify
# - vorbis-tools
# - at
# - wget


SEMVER="v0.0.1"
POMODORO_DIRECTORY=$HOME/.config/pomodoro-timer
RING_FILE=bell.ogg
POMODORO_JOB=pomodoro.job

main() {
  if test $# -eq 0; then
    set_pomodoro_timer 25
  elif test $# -eq 1; then
    case $1 in
      -h|--help|help) help;;
      -V|--version|version) echo $SEMVER;;
      destroy) destroy_pomodoro;;
      *) set_pomodoro_timer $1;;
    esac
  else
    echo 'Error: pomodoro-timer accepts zero or one argument.'
    return 1
  fi
}


help() {
  echo 'A simple pomodoro timer.'
  echo ''
  echo 'Usage: pomodoro-timer [count]'
  echo ''
  echo 'The unit of <count> is minute.'
  echo 'The default value is 25.'
  echo ''
  echo 'Destroy the current pomodoro:'
  echo ''
  echo '    pomodoro-timer destroy'
}


destroy_pomodoro() {
  atrm $(cat $POMODORO_DIRECTORY/$POMODORO_JOB)
  echo 'Pomodoro destroyed!'
}

set_pomodoro_timer() {
  argument=$1
  
  parse_argument $argument  
  check_ring_file_available
  start_pomodoro_timer $argument
}


parse_argument() {
  argument=$1
  if echo $argument | grep -q -E '^[1-9][0-9]{0,}$'; then
    return 0
  else
    echo 'Error: pomodoro time must be a positive interger.'
    return 1
  fi
}


check_ring_file_available() {
  if test -f $POMODORO_DIRECTORY/$RING_FILE; then
    return 0 
  else
    fetch_ring_file 
  fi
}


fetch_ring_file() {
  local ring_file_url
  ring_file_url='https://github.com/weakish/pomodoro-timer/raw/master/ring-files/'$RING_FILE

  mkdir -p $POMODORO_DIRECTORY && cd $POMODORO_DIRECTORY
  wget --no-check-certificate $ring_file_url

  if test -f $POMODORO_DIRECTORY/$RING_FILE; then
    echo "We have fetched the ring file for you."
    echo "You can use your own ring sound."
    echo "Put it under $POMODORO_DIRECTORY, with the name $RING_FILE."
  else
    echo "Cannot fetch the ring file for you."
    echo "You need to put the ring file under $POMODORO_DIRECTORY, with a name $RING_FILE."
    echo "After that, run pomodoro-timer again."
    return 1
  fi
}


start_pomodoro_timer() {
  pomodoro_time=$1

  echo "ogg123 $POMODORO_DIRECTORY/$RING_FILE; notify-send --urgency=low --expire-time=600 'Pomodoro finished.'" |
  at now + $pomodoro_time min 2>&1 |
  grep -E -o 'job [0-9]+' | grep -E -o '[0-9]+' > $POMODORO_DIRECTORY/$POMODORO_JOB
  echo "Pomodoro started."
}


set -e
main "$@"
