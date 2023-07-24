# Near Discovery API server

This is an API server for Near Discovery.

## Quick Start

### File structure

There are three separate files that are responsible for different functionalities:

* app.js - the main file with the API server logic.

* snapshot.js - this file contains the function that builds the snapshot. The snapshot can be understood as a cache inside the json file. 

* recepits.js - this file contains the function that fetches all recepits from the database.

### DB migrations

The DB migrations can be found in the `near-discovery-indexer` repository: https://github.com/near/near-discovery-indexer/tree/master/example-indexer/migrations.

The project uses Postgres DB and the database should be set up before running the server.

### Building snapshot

Run this command to build the snapshot:

`npm run snapshot`

The snapshot configuration can be found inside the `snapshot.js` file under `testnetConfig` and `mainnetConfig` variables. Set `blockHeight` to the value from which the data in the snapshot should be fetched.

The snapshot.json file can be found in the `res` folder.

### Running the server locally

Be sure to put the environment variables inside the `.env` file:

`DATABASE_URL="postgresql://user:password@192.168.1.1:5432/events"`
`PORT=3030`

Then run:

`npm run start`

to start the server. The API is exposed under the localhost:[PORT] value. You may check the health of the server by openiing the following URL: `http://localhost:3030/health`.

## Contributing

* fork the project
* create the branch from `stage`
* open the PR with a description of proposed changes

## Building and running image

Run this command in the root folder to build the docker image:

`docker build . -t alpha-api`

Then run the image with the following command:

`docker run -p 3030:3030 -e DATABASE_URL='postgresql://[USERNAME]:[PASSWORD]@host.docker.internal:[DB_PORT]/events' -e PORT='3030' alpha-api node "app.js"`