# sti-gradle
FROM openshift/base-centos7

MAINTAINER Albert-Jan de Vries <aj@albert-jandevries.nl>

ENV BUILDER_VERSION 1.0
ENV GRADLE_VERSION 2.13

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building java apps, with gradle" \
      io.k8s.display-name="Java Gradle Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,gradle"

RUN yum install -y --enablerepo=centosplus \
    tar unzip bc which lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all -y && \
    curl -sL -0 https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /usr/local/ && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    mv /usr/local/gradle-${GRADLE_VERSION} /usr/local/gradle && \
    ln -sf /usr/local/gradle/bin/gradle /usr/local/bin/gradle

ENV PATH=/opt/gradle/bin/:$PATH

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

EXPOSE 8080

CMD $STI_SCRIPTS_PATH/usage
