FROM ubuntu:yakkety

WORKDIR /build

RUN apt update && apt dist-upgrade -y && apt install -y snapcraft

# enable multiverse as snapcraft cleanbuild does
RUN sed -i 's/ universe/ universe multiverse/' /etc/apt/sources.list

COPY . /build

RUN snapcraft build
