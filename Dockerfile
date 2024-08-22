FROM node:12

# renovate: datasourceTemplate=go depNameTemplate=github.com/tynany/frr_exporter
ARG FRREXPORTER_VERSION=v1.1.0

ENV PYTHON_VERSION=3.1
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${PYTHON_VERSION}



