FROM openjdk:jdk-bullseye
MAINTAINER Rob Thomas <xrobau@gmail.com>

ARG LANG_LANGUAGE=en
ARG LANG_COUNTRY=US
ENV LANG=${LANG_LANGUAGE}_${LANG_COUNTRY}.UTF-8

# Start by building fernflower
RUN git clone https://github.com/fesh0r/fernflower /usr/local/fernflower && \
    cd /usr/local/fernflower && \
    ./gradlew build && \
    ./gradlew --stop && \
    cp build/libs/fernflower.jar /usr/local/bin/ && \
    cd / && rm -rf /usr/local/fernflower

# Now add all the things we want in the other packages
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install patch bbe vim xmlstarlet && \
    apt-get -y clean


CMD ["/bin/bash"]

