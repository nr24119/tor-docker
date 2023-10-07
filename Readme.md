# Docker Image for Tor Client
Used for testing Onionbalance's Distinct Descriptor Mode

Tasks:
- Initialize Tor
- Wait for Onion Services and Backend Instances to load up
- run curl-Requests for Load Testing (using a script)

docker build -t torclient .

docker run -d --restart always --name client1 torclient
