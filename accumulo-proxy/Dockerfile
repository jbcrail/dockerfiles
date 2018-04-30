FROM sequenceiq/hadoop-docker

LABEL maintainer "Joseph Crail <jbcrail@gmail.com>"

USER root

ENV PATH $PATH:$HADOOP_PREFIX/bin

RUN chown -R root:root $HADOOP_PREFIX

RUN echo -e "\n* soft nofile 65536\n* hard nofile 65536" >> /etc/security/limits.conf

ENV ZK_VERSION 3.4.6
RUN curl -s https://archive.apache.org/dist/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/zookeeper-$ZK_VERSION /usr/local/zookeeper && \
      chown -R root:root /usr/local/zookeeper-$ZK_VERSION && \
      mkdir -p /var/zookeeper

ENV ZOOKEEPER_HOME /usr/local/zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
ADD zookeeper/* $ZOOKEEPER_HOME/conf/

ENV ACC_VERSION 1.5.2
RUN curl -s https://archive.apache.org/dist/accumulo/$ACC_VERSION/accumulo-$ACC_VERSION-bin.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/accumulo-$ACC_VERSION /usr/local/accumulo && \
      chown -R root:root /usr/local/accumulo-$ACC_VERSION

ENV ACCUMULO_HOME /usr/local/accumulo
ENV PATH $PATH:$ACCUMULO_HOME/bin
ADD accumulo/* $ACCUMULO_HOME/conf/

ADD *-all.sh /etc/
RUN chown root:root /etc/*-all.sh && \
      chmod 700 /etc/*-all.sh

ADD init-accumulo.sh /tmp/
RUN /tmp/init-accumulo.sh

EXPOSE 42424
CMD ["/etc/start-all.sh"]
