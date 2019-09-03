# docker-kura
Docker images for Raspberry Pi with Eclipse Kura

## build
On Raspberry Pi 3 (Raspbian Stretch or Buster):

Install docker: https://blog.docker.com/2019/03/happy-pi-day-docker-raspberry-pi/

```
docker login
./build.sh
```

## launch
```
./run-container.sh [port_number]

```
Default port_number is 80

Open browser window to http://rpi_ip_address:port_number
