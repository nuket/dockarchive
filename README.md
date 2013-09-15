Dockerfiles
===========

Dockerfiles that can be included into other Dockerfiles to 
build various, related Ubuntu images for Docker.

Creating uniform includable files means that Docker image creation
will take full advantage of the Docker caching mechanism.


Building Images
---------------

To build the Docker Images, just go into one of the subdirectories
and run:

    cpp -Xpreprocessor -I.. Dockerfile.in -o Dockerfile
    docker build .


