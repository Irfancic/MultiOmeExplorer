## MultiOme WEB APPLICATION

# Docker Setup

In order to run this app in docker, you can use the provided Dockerfile. Hence it is a Dockerfile, you have to build the image for it.

```bash
docker build -t multiome-app .
```

Once the build phase is over, you can run the image in a container.

```bash
docker run -p 3838:3838 multiome-app # add -d for running in background
```

Useful commands:
```bash
docker ps -a # list all containers
docker image list # list all images
docker rm <container-id> # remove container
docker rmi <image-id> # remove image
```