FROM alpine:latest

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>


ENV LANG en_US.UTF-8
ENV PATH "/root/.poetry/bin:${PATH}"
ENV POETRY_PREVIEW 1
RUN apk --update add bash python3 build-base libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev freetype-dev libpng-dev libxslt-dev
RUN pip3 install -U pip wheel && wget -qO- https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python && mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
RUN wget -qO- https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz | tar -xz -C /tmp/ && mv /tmp/fd-v7.4.0-x86_64-unknown-linux-musl/fd /usr/local/bin/ && rm -rf /tmp/fd-v7.3.0-x86_64-unknown-linux-musl/
