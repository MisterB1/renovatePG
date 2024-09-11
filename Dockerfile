FROM ubuntu:24.02 as base
 
# renovate: datasource=go depName=github.com/tynany/frr_exporter
ARG FRREXPORTER_VERSION=v1.3.0
 