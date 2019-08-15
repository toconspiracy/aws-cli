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

WORKDIR /usr/src/app

COPY --from=builder /root/.local /root/.local

COPY . .

RUN apk add groff

ENV PATH=/root/.local/bin:$PATH
ENTRYPOINT [ "aws" ]
CMD ["--version"]
