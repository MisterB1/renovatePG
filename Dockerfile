FROM python:3.7

ARG FRREXPORTER_VERSION=v1.2.0

WORKDIR /Applied_Machine_Learning_with_Python
COPY requirements.txt /Applied_Machine_Learning_with_Python/
RUN pip install -r requirements.txt

CMD ["/bin/bash"]

