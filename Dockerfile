FROM ubuntu:14.04


# Install Java.
 RUN \
  #add-apt-repository ppa:openjdk-7/ppa && \
  apt-get update && \
  apt-get install -y openjdk-7-jdk && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64


# Installs Ant
ENV ANT_VERSION 1.8.4
RUN cd && \
    wget -q https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# Installs Ant-Contrib
ENV ANT_CONTRIB_VERSION 1.0b3
RUN cd && \
    wget -q https://sourceforge.net/projects/ant-contrib/files/ant-contrib/1.0b3/ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz && \
    tar -xzf ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz && \
    mv ant-contrib/ant-contrib-${ANT_CONTRIB_VERSION}.jar /opt/ant/lib && \
    rm ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/lib    
    
# Installs dos2unix
RUN apt-get update && \
    apt-get install dos2unix && \
    apt-get clean

# Install Curl
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean
