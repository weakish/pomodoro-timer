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

Use rake:

    rake install

The script will be installed into `/usr/bin/`.

If you want to install to other place, use a `prefix`, e.g.

    rake "install[/usr/local]"

If you don't want to use rake, you can just copy this script to any directory in your PATH.


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


Pomodoro technique
------------------

The Pomodoro Technique is a time management method developed by Francesco Cirillo in the late 1980s.
The technique uses a timer to break down periods of work into 25-minute intervals called "pomodori" (from the Italian word pomodoro for "tomato"), separated by short breaks.
For more information, have a look at [its wikipedia page](https://en.wikipedia.org/wiki/Pomodoro_Technique).

License
---------

0BSD
