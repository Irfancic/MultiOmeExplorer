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

## Public
https://multiome-app-deployment.azurewebsites.net/

## Deploying to Azure

For deployment and hosting we will use Azure 
1. Have an Azure account (free option is also possible)
2. Create a resource group (all azure resources are placed in groups)
```bash
#azure bash
az group create --name dockerized-applications --location germanywestcentral
# az group create --name [group-name] --location [location]
```
Every resource has to be ordered to a resource group. 

3. Create an App Service Plan
```bash
#azure bash
az appservice plan create --name app-service-plan-1 --resource-group dockerized-applications --sku FREE
# you can use the command but the marketplace is much simpler for this
```

4. Deploying images to docker hub
```bash
# local bash
docker login # login to your dockerhub account
docker build -t my-app .
docker tag my-app username/my-app
docker push username/my-app # check the repo in your repos
```

5. Deploying docker images
```bash
#azure bash
az webapp create --resource-group dockerized-applications --plan app-service-plan-1 --name app-aio --deployment-container-image-name irfancic98/app-aio

az webapp create --resource-group dockerized-applications --plan app-service-plan-1 --name multiome-app-deployment --deployment-container-image-name irfancic98/multiome-app

az webapp create --resource-group group-name --plan app-service-plan --name name-your-application --deployment-container-image-name username/my-app
# --deployment-container-image-name username/my-app # is where to pull from, what dockerhub image
```