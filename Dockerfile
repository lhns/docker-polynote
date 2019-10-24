FROM oracle/graalvm-ce
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV POLYNOTE_VERSION 0.2.8
ENV POLYNOTE_NAME polynote
ENV POLYNOTE_FILE ${POLYNOTE_NAME}-dist.tar.gz
ENV POLYNOTE_URL https://github.com/polynote/polynote/releases/download/$POLYNOTE_VERSION/$POLYNOTE_FILE
ENV POLYNOTE_HOME /opt/polynote

ENV JAVA_OPTS -Xmx2G


ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/cleanimage", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN yum install -y \
      python3-devel \
 && pip3 install
      jep
      jedi
      virtualenv \
 && cleanimage

RUN cd /tmp \
 && curl -LO $POLYNOTE_URL \
 && tar -xf $POLYNOTE_FILE \
 && mv $POLYNOTE_NAME $POLYNOTE_HOME \
 && cleanimage


WORKDIR $POLYNOTE_HOME

CMD ./polynote
