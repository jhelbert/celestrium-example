Here's an extremely simple interface which uses [Celestrium](https://github.com/jdhenke/celestrium).

## Setup

```bash
git clone --recursive https://github.com/jdhenke/celestrium-example.git
cd celestrium-example
npm install
sh server.sh
```

1. Go to [http://localhost:8080/index.html](http://localhost:8080/index.html)
2. Click the node that appears
3. Type `+` to dynamically bring in other nodes.

You should see an example Graph with nodes A, B and C with a strong link between A and B and a weak link between B and C.

## Explanation

- `server.sh` starts the server by 
  - compiling coffeescript files in this example repo
  - compiling the coffeescript files in celestrium
  - running a simple node app which staticly serves `www/`
- `www/celestrium` is a [git submodule](http://git-scm.com/book/en/Git-Tools-Submodules) of [Celestrium](https://github.com/jdhenke/celestrium).
- `www/index.html` loads Celestrium's default css and the `www/main.js` through [requirejs](http://requirejs.org/).
- `www/main.js` is responsible for
  - configuring where the celestrium repo is relative to the publicly served directory
  - configuring where plugins defined in this example repo are located relative to the served directory
  - initializing the desired plugins for this example interface
- `www/ExampleDataProvider.coffee` is the only plugin this example interface defines.
It extends Celestrium's `DataProvider` plugin to tell Celestrium how to dynamically bring in data.

**See the source for more details.**

## Cooler Interface

Run the server and go to [http://localhost:8080/random.html] to see a randomly generated graph and use link strength distribution plugin.
