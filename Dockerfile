ARG JAVA_VERSION=19

ARG JRE_IMAGE=eclipse-temurin
ARG JRE_IMAGE_TAG=${JAVA_VERSION}-jre
ARG JAR_FILE=yb-workload-sim.jar
ARG APP_NAME=workload-simulator
ARG APP_PORT=8080

FROM ${JRE_IMAGE}:${JRE_IMAGE_TAG}

ARG APP_NAME
ENV container=${APP_NAME}

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

ADD jar/yb-workload-sim-0.0.8.jar /opt/workspace/yb-workload-sim.jar

ENV JAR_FILE=yb-workload-sim.jar
ENV JAVA_OPTS=""


ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS}  -jar /opt/workspace/${JAR_FILE}"]
