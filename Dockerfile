FROM alpine:3.9
MAINTAINER CrazyHams https://crazyhams.dev

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="Jonathan Gonzalez <j@0x30.io>" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="uSpider-MQTT" \
      org.label-schema.description="This project builds a ham radio dx sport cluster telnet client." \
      org.label-schema.url="https://hub.docker.com/r/ea1het/uspider-mqtt" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://hub.docker.com/r/ea1het/uspider-mqtt" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache python3                                  \
    && python3 -m ensurepip                                     \
    && pip3 install -U pip                                      \
    && rm -rf /usr/lib/python*/ensurepip                        \
    && rm -rf /root/.cache                                      \
    && rm -rf /var/cache/apk/*                                  \
    && find /                                                   \
        \( -type d -a -name test -o -name tests \)              \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \)      \
        -exec rm -rf '{}' +                                     \
    && mkdir /app

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3"]
CMD ["app.py"]
