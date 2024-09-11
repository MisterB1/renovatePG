FROM ubuntu:24.04@sha256:8a37d68f4f73ebf3d4efafbcf66379bf3728902a8038616808f04e34a9ab63ee as base
 
# renovate: datasource=go depName=github.com/tynany/frr_exporter
ARG FRREXPORTER_VERSION=v1.2.0
 