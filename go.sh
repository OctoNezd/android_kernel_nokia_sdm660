#!/bin/bash
set -e
docker run --user $UID:$GID --rm -it -v .:/src kernelenv:latest /src/build.sh
./create-ak3.sh
