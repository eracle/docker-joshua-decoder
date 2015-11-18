FROM java:7
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Setup env
USER root
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64
ENV ANT_HOME /usr/local/ant
ENV HADOOP /usr/local/hadoop
ENV JOSHUA /usr/local/joshua

# download ant, hadoop & josuha decoder
RUN apt-get update && \
 wget -q -O - http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.6-bin.tar.gz | tar -xzf - -C /usr/local && \
 wget -q -O - http://apache.mirrors.pair.com/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz | tar -xzf - -C /usr/local && \
 wget -q -O - http://cs.jhu.edu/~post/files/joshua-6.0.5.tgz | tar -xzf - -C /usr/local && \
 wget -q -O - http://cs.jhu.edu/~post/language-packs/language-pack-ar-en-phrase-2015-03-18.tgz | tar -xzf - -C /usr/local && \
 ln -s /usr/local/hadoop-2.7.1 /usr/local/hadoop && \
 ln -s /usr/local/ant-1.9.6 /usr/local/ant && \
 ln -s /usr/local/joshua-6.0.5 /usr/local/joshua

WORKDIR /usr/local/joshua
RUN /usr/local/ant/bin/ant

#Ports:
EXPOSE 5674

WORKDIR /usr/local/language-pack-ar-en-phrase-2015-03-18
CMD ["./run-joshua.sh"]
