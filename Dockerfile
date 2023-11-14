FROM debian:12-slim
LABEL org.opencontainers.image.source=https://github.com/HoshinoRei/wide-dhcpv6-client-docker
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wide-dhcpv6-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV INTERFACE=ppp0
VOLUME /etc/wide-dhcpv6/dhcp6c.conf
ENTRYPOINT dhcp6c -c /etc/wide-dhcpv6/dhcp6c.conf -Df $INTERFACE
