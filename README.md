# README

This app is designed to be a training tool for @forced-request's Defense-in-Depth engineering workshop.

# Running the App
Utilizing Docker is the recommended approach, to help minimize runtime dependency concerns.

## Building the basic image

```bash
docker build . -t skate
```

## Running the image
We utilize a bind-mount to ensure that the source code can be easily modified without rebuilding the image.

```Bash
 docker run --name skate -d -p 3000:3000 --mount type=bind,source=`pwd`,target=/application -t skate
 ```

## Generating Application Routes

`docker exec -it skate rails routes`

## Running tests
`docker exec -it skate bin/rake test`