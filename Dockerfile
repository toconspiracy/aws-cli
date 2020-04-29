FROM python:3.7-alpine as base

FROM base as builder

RUN mkdir /install
WORKDIR /install

RUN pip install \
        --no-cache-dir \
        --compile \
        --user \
        --global-option=build_ext \
        --global-option="-j 4" \
        awscli

FROM base

RUN apk add groff bash \
    && adduser -h /home/aws -s /bin/sh aws --disabled-password --gecos ""

COPY --from=builder /root/.local /home/aws/.local

RUN chown -R aws:0 /home/aws/.local \
    && chmod -R u+x /home/aws/.local \
    && chmod -R g=u /home/aws/.local

USER aws

WORKDIR /home/aws
ENV PATH=/home/aws/.local/bin:$PATH
ENV HOME=/home/aws
ENTRYPOINT [ "aws" ]
CMD ["--version"]
