pomodoro-timer
==============

A simple pomodoro timer.

Depends
-------

- libnotify
- vorbis-tools
- at
- wget

Install
-------

### With basher

```sh
; basher install weakish/pomodoro-timer
```

Require [basher][] version: `>=39875bc`.

[basher]: https://github.com/basherpm/basher

### With rake

    rake install

The script will be installed into `/usr/bin/`.

If you want to install to other place, use a `prefix`, e.g.

    rake "install[/usr/local]"

### Manually

If you don't want to use basher or rake,
you can just copy `pomodoro-timer.sh` to any directory in your PATH.

Usage
-----

    pomodoro-timer

By default, a pomodoro takes 25 minutes.

Prefer a short pomodoro? No problem!

    pomodoro-timer 15

Want to destroy the current pomodoro?

    pomodoro-timer destroy


Ring file
---------

Ring file is located at `~/.config/pomodoro-timer/bell.ogg`.
You can replace it with your own ring file,
as long as your ring file is Ogg Vorbis audio file.

Test
------

### With rake

```sh
; rake test
```

### Manually

```sh
; cd test
; bats pomodoro-timer.bats
```

Do not forget to run atq and atrm after tests.
Otherwise, there will be a lot of notifications!

Pomodoro technique
------------------

The Pomodoro Technique is a time management method developed by Francesco Cirillo in the late 1980s.
The technique uses a timer to break down periods of work into 25-minute intervals called "pomodori" (from the Italian word pomodoro for "tomato"), separated by short breaks.
For more information, have a look at [its wikipedia page](https://en.wikipedia.org/wiki/Pomodoro_Technique).

License
---------

0BSD
