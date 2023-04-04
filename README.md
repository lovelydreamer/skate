# README

This app is designed to be a training tool for @forced-request's Defense-in-Depth engineering workshop.

The application has been designed to work with [GitHub Codespaces](https://docs.github.com/en/codespaces/overview), or locally via a Devcontainer file. In either case, local usage of Visual Studio code is recommended. Please utilize the following extensions:

- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces

# Running the App

To run the application, execute the following in Codespaces / DevContainer:

```
script/server
```

# Docker Instructions

<details>

<summary>Click here to view legacy instructions</summary>


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

```
Clone Repo: git@github.com:forced-request/23-skate-roc.git
docker build . -t skate
docker run -d -p 3000:3000 --mount type=bind,source=`pwd`,target=/application -t skate
docker exec -it skate rails db:migrate
Docker exec –it skate npm i -g yarn
Docker exec –it skate rails webpacker:install
```

### Windows Users

Problems generally realted to bind-mounts. Try:

`docker run --name skate -d -p 3000:3000 --mount type=bind,source=”%cd%”,target=/application -t skate`

</details>