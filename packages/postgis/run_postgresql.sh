#!/bin/bash

# This script is run by Supervisor to start PostgreSQL 9.1 in foreground mode

# Shutdown function from http://serverfault.com/questions/425132/controlling-tomcat-with-supervisor
function shutdown()
{
    echo "Shutting down PostgreSQL"
    pkill postgres
}

if [ -d /var/run/postgresql ]; then
    chmod 2775 /var/run/postgresql
else
    install -d -m 2775 -o postgres -g postgres /var/run/postgresql
fi

# Allow any signal which would kill a process to stop PostgreSQL
trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

exec sudo -u postgres /usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main --config-file=/etc/postgresql/9.1/main/postgresql.conf
