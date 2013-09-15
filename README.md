Dockerfiles
===========

Dockerfiles that can be included into other Dockerfiles to 
build various, related Ubuntu images for Docker.


Building Images
---------------

To build the Docker Images, just go into one of the subdirectories
and run:

cpp -Xpreprocessor -I.. Dockerfile.in -o Dockerfile
docker build .

