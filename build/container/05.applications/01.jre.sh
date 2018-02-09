#!/bin/bash

#set -o verbose
set -o errexit
set -o nounset
#set -o xtrace

export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre
export PATH="${PATH}:/usr/lib/jvm/java-1.8-openjdk/jre/bin"

declare JAVA_VERSION=8u131
declare JAVA_ALPINE_VERSION=8.131.11-r2


