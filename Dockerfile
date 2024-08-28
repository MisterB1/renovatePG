#FROM hub.docker.internal.cba/golang:1.21 AS acmbuilder
FROM ubuntu:24.04 as base
 
# Use Artifactory
ENV GOPROXY=https://artifactory.internal.cba/org.golang.proxy
ENV GOSUMDB=off
 
WORKDIR /src
 
# Cache dependencies
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download
 
# Copy Source Code
COPY . .
 
# Build
RUN make bin/dns-anycast-manager-linux-amd64
 
######
 
#FROM hub.docker.internal.cba/golang:1.21-bullseye AS frrexporter
 
# renovate: datasource=go depName=github.com/tynany/frr_exporter
# ARG FRREXPORTER_VERSION=v1.2.0
 
ENV GOPROXY=https://artifactory.internal.cba/org.golang.proxy
ENV GOSUMDB=off
 
WORKDIR /src
 
RUN go install github.com/tynany/frr_exporter@$FRREXPORTER_VERSION
RUN cp ${GOPATH}/bin/frr_exporter /
 
##########
 
# FROM applicationinfrastructure-public.docker.internal.cba/library/ubuntu:24.04@sha256:20aa388836c09f052fcd69462b2337de56a628b11b50bf40948927efd1927991
 
ARG FRR_VERSION=10.1
RUN apt-get update && apt-get -y upgrade
 
RUN apt-get install -y libc6 lsb-release net-tools git curl gnupg2
RUN curl -k -s https://artifactory.internal.cba/artifactory/org.frrouting.deb/keys.asc | apt-key add -
RUN echo deb https://artifactory.internal.cba/artifactory/org.frrouting.deb $(lsb_release -s -c) frr-$FRR_VERSION | tee -a /etc/apt/sources.list.d/frr.list
 
RUN apt update && apt install -y frr=${FRR_VERSION}-0~ubuntu24.04.1 frr-pythontools
 
# Copy FRR Exporter and Anycast Manager Binaries
COPY --from=frrexporter /frr_exporter /
COPY --from=acmbuilder /src/bin/dns-anycast-manager-linux-amd64 /
COPY frr/frr-start.sh /usr/lib/frr
COPY frr/docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh /frr_exporter /dns-anycast-manager-linux-amd64 /usr/lib/frr/frr-start.sh
RUN mkdir -p /var/run/frr && chown -R frr:frr /var/run/frr
CMD ["/docker-entrypoint.sh"]