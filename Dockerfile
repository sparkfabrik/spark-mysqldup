FROM alpine:latest
LABEL org.opencontainers.image.source https://github.com/sparkfabrik/spark-mysqldup

WORKDIR /workspace
ARG ACTINGUSER=1000
USER root

RUN apk --no-cache add mysql-client bash

ENTRYPOINT []
CMD ["/do-dup.sh"]
COPY ./do-dup.sh /do-dup.sh
RUN chmod a+x /do-dup.sh \
    && chmod -R g+w /workspace

USER ${ACTINGUSER}
