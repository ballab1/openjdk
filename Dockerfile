ARG FROM_BASE=${DOCKER_REGISTRY:-}${OS:-}base_container:${BASE_TAG:-latest}
FROM $FROM_BASE

# name and version of this docker image
ARG CONTAINER_NAME=openjdk
# Specify CBF version to use with our configuration and customizations
ARG CBF_VERSION

# include our project files
COPY build Dockerfile /tmp/

# set to non zero for the framework to show verbose action scripts
#    (0:default, 1:trace & do not cleanup; 2:continue after errors)
ENV DEBUG_TRACE=0


# java version being bundled in this docker image
ARG JAVA_VERSION=8.171.11-r0
LABEL java.version=$JAVA_VERSION

ENV JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-1.8-openjdk}


# build content
RUN set -o verbose \
    && chmod u+rwx /tmp/build.sh \
    && /tmp/build.sh "$CONTAINER_NAME" "$DEBUG_TRACE"
RUN [ $DEBUG_TRACE != 0 ] || rm -rf /tmp/*


ENTRYPOINT [ "docker-entrypoint.sh" ]
#CMD ["$CONTAINER_NAME"]
CMD ["openjdk"]
