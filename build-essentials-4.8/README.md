Dockerfile to create an Ubuntu 12.04 environment with build-essentials
installed, but using gcc-4.8 and g++-4.8 instead of GCC 4.6.

Build
-----

    cpp -Xpreprocessor -I.. Dockerfile.in -o Dockerfile
    docker build .
