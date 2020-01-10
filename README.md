# oob-bind
Wrapper around the resystit/bind9 docker image that starts a minimalist bind server

# requirements
- docker
- your machine is configured as the NS for your domain (or subdomain)

# usage
```bash
git clone https://github.com/fersingb/oob-bind/
cd oob-bind
./start-foreground.sh <your domain> <your ip>
or
./start.sh <your domain> <your ip>
```
