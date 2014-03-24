Configuration options
==

Dockerfile.admin-user
---

The admin account name and password can be overriden when 
calling cpp by setting -DADMIN_USERNAME=newname and 
-DADMIN_PASSWORD=`openssl passwd -1 $PASS`.

    #define ADMIN_USERNAME admin
    #define ADMIN_PASSWORD sa1aY64JOY94w

Dockerfile.jenkins-user
---

The jenkins account name and password can be overriden when 
calling cpp by setting -DJENKINS_USERNAME=newname and 
-DJENKINS_PASSWORD=`openssl passwd -1 $PASS`.

    #define JENKINS_USERNAME jenkins
    #define JENKINS_PASSWORD sa1aY64JOY94w

A .ssh folder can be initialized by setting
-DJENKINS_DOT_SSH=path/to/.ssh.
    