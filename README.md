# NGINX UNIT

Test image for: https://github.com/nginx/unit

## Quick Start

Prepare working directory:

    #index.php
    <?php phpinfo(); ?>

    #config.json
    {
      "listeners": {
        "*:8000": {
          "application": "default"
        }
      },
      "applications": {
        "default": {
          "type": "php",
          "workers": 10,
          "root": "/www",
          "index": "index.php"
        }
      }
    }

Run nginx unit and configure it

    export PORT=8000

    export UNIT=$(docker run --rm -d -v $(pwd):/www -p $PORT:8000 xytis/unitd)

    docker exec -ti $UNIT curl -X PUT -d @/www/config.json --unix-socket /var/run/control.unit.sock http://localhost/

    curl http://localhost:$PORT
