#!/bin/bash
# Source: https://confluence.atlassian.com/plugins/viewsource/viewpagesrc.action?pageId=252348917
function shutdown()
{
    date
    echo "Shutting down Tomcat"
    __CATALINA_HOME__/bin/catalina.sh stop
}

date
echo "Starting Tomcat"

#   CATALINA_HOME   May point at your Catalina "build" directory.
export CATALINA_HOME=__CATALINA_HOME__

#   CATALINA_BASE   (Optional) Base directory for resolving dynamic portions
#                   of a Catalina installation.  If not present, resolves to
#                   the same directory that CATALINA_HOME points to.
export CATALINA_BASE=__CATALINA_BASE__
export CATALINA_PID=__CATALINA_BASE__/catalina.pid

# Uncomment to increase Tomcat's maximum heap allocation
# export JAVA_OPTS=-Xmx512M $JAVA_OPTS

source __CATALINA_HOME__/bin/catalina.sh

# Allow any signal which would kill a process to stop Tomcat
trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

echo "Waiting for `cat $CATALINA_PID`"
wait `cat $CATALINA_PID`
