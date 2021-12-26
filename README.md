# Using ns-3 simulator with Docker with Apple Silicon - M1

Apple Silicon M1 uses ARM architecutre and exisitng ns3 docker images are not build for the architecure. You can build your own images. 

## Getting Started

First, you need to install Docker Desktop for Apple Silicon [https://www.docker.com/get-started](https://www.docker.com/get-started). 


1. Get this repository and build from terminal
```shell
docker build -t ns3-base .
```

2. Run the container
```
docker run -itd --name ns3 ns3-base
```

3. Run the simulation
```shell
docker exec -it ns3 ./waf --run scratch/scratch-simulator
```

