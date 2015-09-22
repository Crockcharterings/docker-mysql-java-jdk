FROM quay.io/ukhomeofficedigital/mysql:v0.5.1

# Install Open Java 8
# ===================

# Set correct environment variables.
ENV	HOME /root
ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8

# See https://github.com/docker/docker/issues/10180# for why the strange yum!
RUN YUM_CMD="yum install -y java-1.8.0-openjdk-devel" && \
    (${YUM_CMD} || ${YUM_CMD}) && \
    yum clean all
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

VOLUME ["/root/.gradle/caches"]
VOLUME ["/code"]
WORKDIR /code

ADD run_mysql_and_some.sh /

ENTRYPOINT ["/run_mysql_and_some.sh"]