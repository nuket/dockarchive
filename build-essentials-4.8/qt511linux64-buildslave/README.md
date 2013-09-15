Warning
-------

This Docker image doesn't yet work, because there's currently no way to silent-install packages using the Qt Installer Framework:


    qt511linux64-buildslave$ ./qt-linux-opensource-5.1.1-x86_64-offline.run --help
    Usage: SDKMaintenanceTool [OPTIONS]
    
    User:
    --help                                               Show commandline usage                  
    --version                                            Show current version                    
    --checkupdates                                       Check for updates and return an XML file of the available updates
    --proxy                                              Set system proxy on Win and Mac. This option has no effect on Linux.
    --verbose                                            Show debug output on the console        
    --create-offline-repository                          Offline installer only: Create a local repository inside the installation directory based on the offline installer's content

    Developer:
    --runoperation [operationName] [arguments...]        Perform an operation with a list of arguments
    --undooperation [operationName] [arguments...]       Undo an operation with a list of arguments
    --script [scriptName]                                Execute a script                        
    --no-force-installations                             Enable deselection of forced components 
    --addRepository [URI]                                Add a local or remote repo to the list of user defined repos.
    --addTempRepository [URI]                            Add a local or remote repo to the list of temporary available repos.
    --setTempRepository [URI]                            Set a local or remote repo as tmp repo, it is the only one used during fetch.
    Note: URI must be prefixed with the protocol, i.e. file:/// , http:// or ftp://
    --show-virtual-components                            Show virtual components in package manager and updater
    --binarydatafile [path/to/binary/data/file]          Use the binary data of another installer or maintenance tool.
    --update-installerbase [path/to/new/installerbase]   Patch a full installer with a new installer base
    --dump-binary-data [OPTION...] -o path               Dumps the binary content into specified path (offline installer only)
    -i                            Path to binary data file, otherwise the current application is assumed to be the input file.


Info
====

A Docker image that contains the Qt build system for use as a Buildbot buildslave.

Build
-----

To build this Docker image:

    cpp -Xpreprocessor -I../.. Dockerfile.in -o Dockerfile
    docker build .

