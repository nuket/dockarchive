Info
====

A Docker image that contains the Qt build system for use as a Buildbot buildslave.

Build
----

To build this Docker image:

    cpp -DENABLE_APT_CACHE -I../../.. Dockerfile.in -o Dockerfile
    docker build .

To change default settings:

    cpp -DENABLE_APT_CACHE \
        -DBUILDBOT_SLAVE_MASTER="192.168.0.1:9989" \
        -DBUILDBOT_SLAVE_USERNAME="bob" \
        -DBUILDBOT_SLAVE_PASSWORD="password" \ 
        -I../../.. Dockerfile.in -o Dockerfile


Defines
----

These can be overriden on the `cpp` command line with `-DBUILDBOT_SLAVE_USERNAME=somethingelse` and so on:

   *   **BUILDBOT_SLAVE_MASTER** tells the Docker image which host:port to contact as its Buildbot master.
   *   **BUILDBOT_SLAVE_USERNAME** and **BUILDBOT_SLAVE_PASSWORD** are the Buildbot credentials.
