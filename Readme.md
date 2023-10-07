# Docker Image for Tor Client
Used for testing Onionbalance's Distinct Descriptor Mode

Tasks:
- Initialize Tor
- Wait for Onion Services and Backend Instances to load up
- run curl-Requests for Load Testing (using a script)



docker run -d --restart always --name client1 torclient
# Quick Command Lookup
## git
git checkout docker-client

git pull origin docker-client

## docker
docker build -t \<imageName> .

docker run -d --restart always --name \<containerName> \<imageName>

docker ps

docker stop \<dockerId>

docker rm \<dockerId>

docker image rm \<imageName>
