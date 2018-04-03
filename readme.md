How to run and deploy on Arduboy without using the Arduino IDE (sorta).

- This script assumes you're running on Mac OS High Sierra.
- Install Arduino IDE and ArduBoy, instructions here: https://arduboy.com/download-and-learn-arduino/ (you still have to install it... for now, but after the main installation you shouldn't have to use it for anything except trouble shooting).
- Make sure hello world for arduboy works from the IDE (it's under the Examples menu item).
- Install Python 2.7.
- Install pip if needed: `python -m get_pip.py --user`.
- Install the pyserial library: `python -m pip install pyserial --user`.
- Run `make test` to run a test suite on your computer (this is great because you can do most of your headless game development on your computer and then only deploy to the device when you're ready to).
- Run `make all` to run a test suite and deploy to the Arduboy.
- Source code is inside of `main.c` and `game.h`.
