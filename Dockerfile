ARG FROM_BASE=base_container:20180210
FROM $FROM_BASE

# version of this docker image
ARG CONTAINER_VERSION=1.0.0 
LABEL version=$CONTAINER_VERSION  

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8

# Add configuration and customizations
COPY build /tmp/

# build content
RUN set -o verbose \
    && chmod u+rwx /tmp/container/build.sh \
    && /tmp/container/build.sh 'OPENJDK-JDK'
RUN rm -rf /tmp/*


ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=${PATH}:${JAVA_HOME}/bin