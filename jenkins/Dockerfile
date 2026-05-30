FROM jenkins/jenkins:alpine
USER root
COPY ./healthcheck.sh /
RUN set -ex && \
    apk add --no-cache curl jq docker
HEALTHCHECK --start-period=60s --start-interval=10s --interval=600s CMD /healthcheck.sh
USER jenkins
