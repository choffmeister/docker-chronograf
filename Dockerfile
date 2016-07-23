FROM debian:8.1
MAINTAINER Christian Hoffmeister <mail@choffmeister.de>

ENV CHRONOGRAF_VERSION 0.13.0

RUN \
  apt-get update && \
  apt-get install --yes wget && \
  wget -qO /tmp/chronograf_${CHRONOGRAF_VERSION}_amd64.deb https://dl.influxdata.com/chronograf/releases/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
  dpkg -i /tmp/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
  apt-get remove --yes wget && \
  apt-get autoremove --yes && \
  apt-get clean
ADD config.toml /opt/chronograf/config.toml

WORKDIR /opt/chronograf
EXPOSE 10000
CMD ["./chronograf", "--config", "config.toml"]
