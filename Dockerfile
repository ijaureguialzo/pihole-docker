ARG PIHOLE_VERSION=latest

FROM pihole/pihole:${PIHOLE_VERSION}

RUN apk add nano
