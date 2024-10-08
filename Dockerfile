#FROM hub.docker.internal.cba/golang:1.21 AS acmbuilder
FROM ubuntu:24.04@sha256:b359f1067efa76f37863778f7b6d0e8d911e3ee8efa807ad01fbf5dc1ef9006b as base
 
# renovate: datasource=go depName=github.com/tynany/frr_exporter
ARG FRREXPORTER_VERSION=v1.2.0
 
