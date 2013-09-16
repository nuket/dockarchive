Configuration options
==

Dockerfile.admin-user
---

The admin account name and password can be overriden when 
calling cpp by setting -DADMIN_USERNAME=newname and 
-DADMIN_PASSWORD=`openssl passwd -1 $PASS`.

    #define ADMIN_USERNAME admin
    #define ADMIN_PASSWORD sa1aY64JOY94w

