FROM pihole/pihole:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nano
