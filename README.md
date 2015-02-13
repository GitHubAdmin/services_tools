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
project. For the moment, there is only the one tool:

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
      -s uri  Specify the root URL for the service server. Default: 
      -t tkn  Specify the API token for the specified service server. Defaults
              to the value of API_TOKEN
      -a id   Specify the account ID to be configured (required)
      -d dir  Specify the directory in which the accounts
              mds files will be placed on the PCC sftp server (required)

Copyright
=========

Copyright (c) 2015 Dave Sieh.

See LICENSE.txt for details.
