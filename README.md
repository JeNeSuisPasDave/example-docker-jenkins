# Example of running Jenkins CI in a Docker Container

This repository contains example Docker recipes and supporting scripts that demonstrate running Jenkins CI that creates and runs Docker contains within build projects, with the Jenkins CI server itself running in a Docker container. Essentially this is a demonstration of the creation and use of _sibling_ Docker containers.

Requires Docker 1.11 or later.

_Tested on OS X El Capitan (10.11.5) using a boot2docker VirtualBox VM, and on Windows 10 Enterprise using a boot2docker Hyper-V VM._

## Extension of example from The Docker Book

This example is inspired by the Jenkins CI examples from the _Testing with Docker_ chapter of [James Turnbull's _The Docker Book_][dockerbook] (version 1.9.1). I've forked the Git repository he used in the book so that there is [a version that stays synchronized with this example][sample].

[dockerbook]: http://www.dockerbook.com/
[sample]: https://github.com/JeNeSuisPasDave/sample-docker-jenkins

The example in the book used a technique called "Docker in Docker", in which a Docker container is running its own Docker daemon by which child containers are created. That approach turns out to lead to data corruption if you are not careful.

This reworked example avoids the "Docker in Docker" approach, and instead just shares the host Docker daemon port with the Jenkins CI container. The Docker client in that container will then communicate with the Docker daemon on the host, the same daemon that started that Jenkins CI container. New containers that are started from within the Jenkins CI container are started by the host Docker daemon and are _sibling_ containers. This approach avoids the concurrent access issues and other incompatibilities and race conditions that would lead to corrupted data.

## How to perform the examples

1. Build the base Ubuntu image by `cd ubuntu` and `build.sh`
2. Build the base Docker image by `cd docker` and `build.sh`
1. Build the data volume container by `cd jenkins-ci` and `create-dv-jenkins-workspace.sh`
1. Build the Jenkins CI image by `cd jenkins-ci` and `build.sh`
1. Launch the Jenkins CI container with `run.sh`
1. Follow the procedures described in the Jenkins CI examples at the end of the _Testing with Docker_ chapter of [_The Docker Book_][dockerbook].
