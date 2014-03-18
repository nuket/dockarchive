Info
====

Creates a jenkins slave.

Build
----

Place a copy of slave.jar from your jenkins server in this directory,
and a copy of any ssh keys into .ssh, then :
    ../scripts/build.sh 


Launching a slave
----

First run that creates the container:
    docker run -i --name="<name your slave here>" dockarchive/jenkins-slave

Start the container:
    docker start -i <name your slave here>
