#!/usr/bin/env bats

# Dependencies


@test "libnotify installed" {
  command -v notify-send
}

@test "vorbis-tools installed" {
  command -v ogg123
}

@test "at installed" {
  command -v at
}

@test "wget" {
  command -v wget
}


# pomodoro-timer

@test "two arguments" {
  run sh ../pomodoro-timer.sh 25 min
  [ "$status" -eq 1 ]
  [ "$output" = "Error: pomodoro-timer accepts zero or one argument." ]
}


@test "default" {
  run sh ../pomodoro-timer.sh
  [ "$output" = "Pomodoro started." ]
}


@test "help" {
  run sh ../pomodoro-timer.sh help
  [ "${lines[0]}" = "A simple pomodoro timer." ]
}

@test "--help" {
  run sh ../pomodoro-timer.sh --help
  [ "${lines[0]}" = "A simple pomodoro timer." ]
}

@test "-h" {
  run sh ../pomodoro-timer.sh -h
  [ "${lines[0]}" = "A simple pomodoro timer." ]
}


@test "version" {
  run sh ../pomodoro-timer.sh version
  echo "$output" | grep -q -E '^v[0-9]'
}


@test "--version" {
  run sh ../pomodoro-timer.sh --version
  echo "$output" | grep -q -E '^v[0-9]'
}


@test "-V" {
  run sh ../pomodoro-timer.sh -V
  echo "$output" | grep -q -E '^v[0-9]'
}


@test "x minutes" {
  run sh ../pomodoro-timer.sh 6
  [ "$output" = "Pomodoro started." ]
}


@test "xx minutes" {
  run sh ../pomodoro-timer.sh 23
  [ "$output" = "Pomodoro started." ]
}


@test "xxx minutes" {
  run sh ../pomodoro-timer.sh 123
  [ "$output" = "Pomodoro started." ]
}


@test "0 minute" {
  run sh ../pomodoro-timer.sh 0
  [ "$status" -eq 1 ]
  [ "$output" = "Error: pomodoro time must be a positive interger." ]
}

@test "with minutes" {
  run sh ../pomodoro-timer.sh 2min
  [ "$status" -eq 1 ]
  [ "$output" = "Error: pomodoro time must be a positive interger." ]
}

@test "string arguments" {
  run sh ../pomodoro-timer.sh twenty-five
  [ "$status" -eq 1 ]
  [ "$output" = "Error: pomodoro time must be a positive interger." ]
}

@test "destroy" {
  run sh ../pomodoro-timer.sh destroy
  [ "$status" -eq 1 ]
  [ "$output" = "Pomodoro destroyed!" ]
}
