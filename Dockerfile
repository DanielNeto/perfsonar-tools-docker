# perfSONAR tools

FROM danielneto/systemd:centos7
LABEL maintainer="perfSONAR <perfsonar-user@perfsonar.net>"

RUN yum -y install \
    epel-release \
    && yum -y update \
    && rpm -hUv http://software.internet2.edu/rpms/el7/x86_64/latest/packages/perfSONAR-repo-0.9-1.noarch.rpm \
    && yum clean expire-cache \
    && yum -y install \
    perfsonar-tools \
    net-tools \
    sysstat \
    tcpdump \
    && yum clean all \
    && rm -rf /var/cache/yum

# The following ports are used:
# pScheduler: 443
# owamp:861, 8760-9960 (tcp and udp)
# twamp: 862, 18760-19960 (tcp and udp)
# simplestream: 5890-5900
# nuttcp: 5000, 5101
# iperf2: 5001
# iperf3: 5201
# ntp: 123 (udp)
EXPOSE 123/udp 443 861 862 5000 5001 5101 5201 5890-5900 8760-9960/tcp 8760-9960/udp 18760-19960/tcp 18760-19960/udp
