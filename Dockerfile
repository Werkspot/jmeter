FROM openjdk:alpine
ENV JMETER_VERSION=3.2
ENV JMETER_HOME=/usr/local/apache-jmeter-${JMETER_VERSION}
ENV PATH=${JMETER_HOME}/bin:${PATH}
RUN apk update && \
    apk add --no-cache wget && \
    wget http://www.eu.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local/ && \
    rm -rf apache-jmeter-${JMETER_VERSION}.tgz \
            ${JMETER_HOME}/bin/examples \
            ${JMETER_HOME}/bin/templates \
            ${JMETER_HOME}/bin/*.cmd \
            ${JMETER_HOME}/bin/*.bat \
            ${JMETER_HOME}/docs \
            ${JMETER_HOME}/printable_docs && \
    apk del wget
WORKDIR /tests
EXPOSE 4445
ENTRYPOINT ["jmeter"]
CMD ["-?"]
