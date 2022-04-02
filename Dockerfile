ARG PIHOLE_VERSION

FROM pihole/pihole:${PIHOLE_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nano
