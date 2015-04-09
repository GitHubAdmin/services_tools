Services Tools Overview
=======================

This project contains a suite of tools useful for managing configuration 
information in the services subsystem. The services subsystem exposes a 
suite of JSON-based web services to help manage the various configuration
elements of our provided services.

Installation
============

You can get the code from the git repository or just download a zip of the
repository into some directory on your path.

Tool Configuration
==================

Unless otherwise specified, all tools require at least two pieces of 
information to be operational:

1. The host for the services API in the form "https://api.domain.com".
2. The security token allowing access to the API

There are at least two ways to provide these pieces of information: 
environment variables and command line options.

To use the environment variables method, place the following in your .bashrc
(or the configuration file for your favorite shell):

    export SERVICES_HOST=<the host of the services api>
    export API_TOKEN=<the api token>

The command line options will be the same for all tools if you wish to 
specify the host and token there:

    -s <the host of the services api>
    -t <the api token>

Do yourself a favor and use the environment variables method for the api
server you use most often.

The Tools
=========

Over time, there will be an increasing number of tools available in this
project. For the moment, there are only two tools:

check_pcc_dir
-------------

This script allows the user to verify that the PCC sftp directory actually
exists on the server before running the *pcc_account_setup* script.

The help:

    usage: check_pcc_dir options

    This script will attempt to determine if a specified
    directory has been set up for the PCC service.

    OPTIONS:
      -h      Show this message
      -s uri  Specify the root URL for the service server.
      -t tkn  Specify the API token for the specified service server. Defaults
              to the value of API_TOKEN
      -d dir  Specify the directory in which the account's
              mds files will be placed on the PCC sftp server (required)

pcc_account_setup
-----------------

This script provides the ability to fully configure a PCC account providing
only two pieces of information: the ID of the account to be configured and
the directory from which files are to be pulled.

The help:

    usage: pcc_account_setup options

    This script will attempt to set up an account for
    PCC pulls. It will handle the setup for the MDS push
    to well as the configured account/account
    mapping required for PCC.

    OPTIONS:
      -h      Show this message
      -s uri  Specify the root URL for the service server.
      -t tkn  Specify the API token for the specified service server. Defaults
              to the value of API_TOKEN
      -a id   Specify the account ID to be configured (required)
      -d dir  Specify the directory in which the accounts
              mds files will be placed on the PCC sftp server (required)

move_pcc_files.rb
-----------------

This ruby-script is designed to move all the files from one PCC SFTP directory
to another. At this point, the two directories are hardcoded to:

* From: jsh
* To: crg

There are no command-line paramters for this script, although one could consider
putting the directory selection on the command line if this is ever needed again.

For this script you will need the following gems installed:

* net-sftp
* rest-client

Copyright
=========

Copyright (c) 2015 Dave Sieh.

See LICENSE.txt for details.
