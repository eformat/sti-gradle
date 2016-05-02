Gradle - CentOS Docker image
========================================

This repository contains the source for building gradle applications
as a reproducible Docker image using
[source-to-image](https://github.com/openshift/source-to-image).
The resulting image can be run using [Docker](http://docker.io).

Versions
---------------
CentOS versions currently provided are:
* CentOS7

Test
---------------------
This repository also provides a [S2I](https://github.com/openshift/source-to-image) test framework,
which launches tests to check functionality of a simple gradle application built on top of the gradle image.

*  **CentOS based image**

    ```
    $ cd sti-gradle
    $ make test
    ```
