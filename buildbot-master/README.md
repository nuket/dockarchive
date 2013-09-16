Info
====

Creates a buildbot-master system.

Build
----

    cpp -I.. -DENABLE_APT_CACHE Dockerfile.in -o Dockerfile


Login
----

Username/password is admin/admin.

ssh -p $(docker port $CONTAINER_ID 22) admin@localhost


Configuration
----

Stored in the /home/buildbot/master folder.