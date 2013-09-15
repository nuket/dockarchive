Info
====

A Docker image that contains the Qt build system (5.0.2) for use as a Buildbot buildslave.

Build
-----

To build this Docker image:

    cpp -Xpreprocessor -I../.. Dockerfile.in -o Dockerfile
    docker build .

