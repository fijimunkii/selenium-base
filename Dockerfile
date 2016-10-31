FROM ubuntu:14.04.4
MAINTAINER Harrison Powers, harrisonpowers@gmail.com

RUN sudo apt-get update && apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

RUN sudo apt-get update && apt-get install -y --no-install-recommends \
  nodejs vim nano openjdk-7-jre build-essential wget openssh-client \
  xvfb x11vnc firefox=28.0+build2-0ubuntu2 \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init"]

CMD ["bash"]
