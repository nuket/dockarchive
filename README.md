Dockerfiles
===========

A collection of Dockerfiles that can be included into other Dockerfiles to 
build various, related Ubuntu images for Docker. This is also an attempt 
to codify best practices.

Creating uniform includable files means that Docker image creation
will take full advantage of the Docker caching mechanism.


Getting Started
---------------

Before building any images, you need to specify who you are, as the
maintainer of the images you'll be creating:

    echo "MAINTAINER Your Name <email@address.com>" > baselines/Maintainer

You must also specify a user id, so that all images are named <user id>/<image name>:

    echo "Your docker user id" > baselines/UserId
    
or

    echo $USER > baselines/UserId

Building Images
---------------

Dockerfiles are assembled using GPP generic preprocessor. 
See also http://en.nothingisreal.com/wiki/GPP
To install it, run:

    sudo apt-get install gpp

Then, to build the Docker Images, just go into one of the subdirectories
and run:

    ../scripts/build.sh

Depending how deep you are in the hierarchy, the `../` path
needs to refer to the root of the hierarchy.

**Recommended:**

To enable the APT package cache (which is a very good idea),
on your Docker host machine, run:

    sudo apt-get install -y squid-deb-proxy squid-deb-proxy-client

And add the following line to the squid-deb-proxy configuration /etc/squid-deb-proxy/mirror-dstdomain.acl:

    # PPAs
    ppa.launchpad.net

And restart the proxy:

    sudo restart squid-deb-proxy

When building the Docker Images, run:

    ../scripts/build.sh -DENABLE_APT_CACHE=1

This should speed builds up considerably, by caching various .deb 
packages locally.

License
-------

Original work Copyright (c) 2013 Max Vilimpoc
Modified work Copyright (c) 2014 Deveryware http://www.deveryware.com
    
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
