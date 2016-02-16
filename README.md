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

Usage
---------------------
To build a simple [jee application](https://github.com/bparees/openshift-jee-sample)
using standalone [S2I](https://github.com/openshift/source-to-image) and then run the
resulting image with [Docker](http://docker.io) execute:

```
$ s2i build git://github.com/ajdevries/gradle-sparkjava-sample openshift/wildfly-81-centos7 wildflytest
$ docker run -p 8080:8080 wildflytest
```

**Accessing the application:**
```
$ curl 127.0.0.1:8080
```

Test
---------------------
This repository also provides a [S2I](https://github.com/openshift/source-to-image) test framework,
which launches tests to check functionality of a simple gradle application built on top of the gradle image.

*  **CentOS based image**

    ```
    $ cd sti-gradle
    $ make test
    ```

Environment variables
---------------------
To set environment variables, you can place them as a key value pair into a `.sti/environment`
file inside your source code repository.

* JAR_FILE

    Name of the jar-file that needs to run (default: `openshift.jar`)
