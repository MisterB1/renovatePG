FROM python:3.2

ARG FRREXPORTER_VERSION=v1.2.0

ENV PYTHON_VERSION=3.1
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${PYTHON_VERSION}


FROM node:12
ENV YARN_VERSION=1.14.1
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

WORKDIR /Applied_Machine_Learning_with_Python
COPY requirements.txt /Applied_Machine_Learning_with_Python/
RUN pip install -r requirements.txt

CMD ["/bin/bash"]

