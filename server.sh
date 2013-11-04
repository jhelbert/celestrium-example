#!/bin/sh
./node_modules/.bin/coffee --compile www/*.coffee &&\
./node_modules/.bin/coffee --compile -o www/celestrium/core/ www/celestrium/core-coffee/ &&\
node app.js
