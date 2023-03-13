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


## Troubleshooting
If things don't work, try the following:

Clone Repo: forced-request/22-skate-owasp
docker build . -t skate
docker run -d -p 3000:3000 --mount type=bind,source=`pwd`,target=/application -t skate
docker exec -it skate rails db:migrate
Docker exec –it skate npm i -g yarn
Docker exec –it skate rails webpacker:install
