#!/bin/sh

# compile the coffeescript files in this example project
./node_modules/.bin/coffee --watch --compile www/*.coffee &\

# compile the coffeescript files in celestrium
./node_modules/.bin/coffee --watch --compile -o www/celestrium/core/ www/celestrium/core-coffee/ &\

# statically serve files out of ./www/
node app.js
