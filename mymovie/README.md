
# MyMovie API

## Prerequisites

- npm (or yarn)
- Docker

## Configuration

### Port

One port is used:
- `8080`: this port is used to access the API through http.

## Usage

To run the project in **Development mode** follow [this part](###development-mode) and for **Production mode** follow [this part](###production-mode).

### Development mode

When you are developping features on the [OptiSpace API](#OptiSpace-API), you can start the project in development mode.

```
docker-compose up db
npm install
npm start
```

### Production mode
```
docker-compose up --build
```

Once the container is started, access it through http://your-ip-address:8080/.
