# Create a resource group
az group create --location northeurope --name webapps-rg

# Create DEV, QA, PROD environments
az appservice plan create \
--name plan-dev \
--resource-group webapps-rg \
--sku B1 \
--is-linux

az appservice plan create \
--name plan-qa \
--resource-group webapps-rg \
--sku B1 \
--is-linux

az appservice plan create \
--name plan-prod \
--resource-group webapps-rg \
--sku S1 \
--is-linux

# Create PaaS Infrastructure for hosting DEV, QA and PROD Web Apps
az webapp create \
--name webapp-1-dev
--resource-group webapps-rg \
--plan plan-dev \
--runtime "PHP|8.2"

az webapp create \
--name webapp-2-qa  
--resource-group webapps-rg \
--plan plan-qa \
--runtime "PHP|8.2"

az webapp create \
--name webapp-3-prod
--resource-group webapps-rg \
--plan plan-prod \
--runtime "PHP|8.2"

