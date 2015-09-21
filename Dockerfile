FROM docker.io/ubuntu:vivid
MAINTAINER Edgard Castro <castro@edgard.org>

# Keep image updated
ENV REFRESHED_AT 2015-09-21-17-52Z

# Add repositories and update base
RUN echo "deb http://archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ vivid-backports main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu vivid-security main restricted universe multiverse" >> /etc/apt/sources.list \
  && apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qy

# Install software
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends git ca-certificates python python-cheetah unzip unrar \
  && git clone --depth 1 http://github.com/echel0n/SickRage.git /opt/SickRage \
  && apt-get clean \
  && rm -rf /var/lib/apt /tmp/* /var/tmp/*

# Add custom files
COPY files/root /

# Start command
CMD ["/start"]
