ARG CODE_VERSION=base_container:20180207
FROM $CODE_VERSION

ENV VERSION=1.0.0
LABEL version=$VERSION

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8

# Add configuration and customizations
COPY build /tmp/

# build content
RUN set -o verbose \
    && chmod u+rwx /tmp/container/build.sh \
    && /tmp/container/build.sh 'OPENJDK-JRE'
RUN rm -rf /tmp/*

