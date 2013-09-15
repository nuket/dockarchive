Dockerfiles
===========

Dockerfiles that can be included into other Dockerfiles to 
build various, related Ubuntu images for Docker.

Creating uniform includable files means that Docker image creation
will take full advantage of the Docker caching mechanism.

Hierarchy
---------

    .
    ├── baselines
    │   ├── Dockerfile.ubuntu1204
    │   ├── Dockerfile.update-upgrade
    │   └── Maintainer
    ├── build-essentials-4.8
    │   ├── Dockerfile.build-essentials-4.8
    │   ├── Dockerfile.in
    │   ├── qt502linux64-buildslave
    │   │   ├── Dockerfile.in
    │   │   └── Dockerfile.qt502linux64
    │   └── qt511linux64-buildslave
    │       ├── build.sh
    │       ├── Dockerfile.in
    │       └── Dockerfile.qt511linux64
    ├── packages
    │   ├── Dockerfile.add-apt-repository
    │   ├── Dockerfile.buildbot-slave
    │   ├── Dockerfile.enable-apt-cache
    │   ├── Dockerfile.git
    │   ├── Dockerfile.run
    │   ├── Dockerfile.vnc
    │   └── Dockerfile.wget
    └── squid-deb-proxy
        ├── Dockerfile.in
        └── run.sh


Getting Started
---------------

Before building any images, you need to specify who you are, as the
maintainer of the images you'll be creating:

    echo "MAINTAINER Your Name <email@address.com>" > baselines/Maintainer


Building Images
---------------

Then, to build the Docker Images, just go into one of the subdirectories
and run:

    cpp -I.. Dockerfile.in -o Dockerfile
    docker build .

Depending how deep you are in the hierarchy, the `-I..` command
needs to refer to the root of the hierarchy. Otherwise, the preprocessor
won't be able to find the files to include.

**Recommended:**

To enable the APT package cache (which is a very good idea),
on your Docker host machine, run:

    sudo apt-get install -y squid-deb-proxy squid-deb-proxy-client

When building the Docker Images, run:

    cpp -I.. -DENABLE_APT_CACHE Dockerfile.in -o Dockerfile
    docker build .

This should speed builds up considerably, by caching various .deb 
packages locally.


License
-------

Copyright (c) 2013 Max Vilimpoc
    
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

