# FROM resin/rpi-raspbian:stretch
# FROM arm32v7/openjdk:8-jre
FROM arm64v8/openjdk:8-jre-stretch

ARG KURA_VERSION=4.1.0

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	apt-get --yes install apt-utils && \
	apt-get --yes install bluetooth \
				gdebi-core \
				procps \
				usbutils && \
	wget -q http://download.eclipse.org/kura/releases/${KURA_VERSION}/kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb && \
	yes | gdebi kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb && \
	rm kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb && \
	apt-get --yes remove	gdebi-core && \
	apt-get --yes autoremove && \
	apt-get --yes clean

EXPOSE 80

COPY start.sh /

CMD ["/start.sh"]
