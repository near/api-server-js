# Near Discovery Alpha API server

This is an API server for the Near Discovery Alpha.

## Building image

Run this command in the root folder:

`docker build . -t alpha-api`

## Running image locally

`docker run -p 3030:3030 -e DATABASE_URL='postgresql://[USERNAME]:[PASSWORD]@host.docker.internal:[DB_PORT]/events' -e PORT='3030' alpha-api node "app.js"`