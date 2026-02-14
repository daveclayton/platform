# Platform

Docker compose YAML for personal hosted services available via Tailscale.

# Tailscale tips

## Redo connection

- Stop the container with ```docker compose down```
- Remove the contents of the immich data volume if present
- Remove the client from Tailscale
- Create a new client in Tailscale as a Linux machine
- Copy the TS Auth key from the command line in the Tailscale Website and paste it into the .env file
- Start the containers with ```docker compose up -d```
- Sign the machine in the Tailscale UI

# Google clients

https://console.cloud.google.com/