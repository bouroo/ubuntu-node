FROM zercle/docker-ubuntu
MAINTAINER bouroo <bouroo@gmail.com>

# Add locale
RUN locale-gen en_US.UTF-8 && locale-gen th_TH.UTF-8 && dpkg-reconfigure locales

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Bangkok

# Update OS
RUN apt-get update && apt-get dist-upgrade -y

# Install nodejs LTS
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get -y install nodejs && npm i -g npm

# Clean file
RUN apt-get autoclean

COPY ./files /
RUN chmod +x /root/run-server.sh

EXPOSE 3000

WORKDIR /app

VOLUME ["/app"]

ENTRYPOINT ["/root/run-server.sh"]
