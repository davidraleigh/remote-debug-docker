ARG TAG=latest
ARG IMAGE=debian
FROM ${IMAGE}:${TAG}

# install supervisor just in case it isn't already installed
RUN apt-get update && apt-get install -y openssh-server supervisor

ADD *.conf /etc/supervisor/conf.d/

RUN mkdir -p /var/run/sshd /var/log/supervisor

ADD ./.pycharm_helpers /root/.pycharm_helpers

# http://www.linuxproblem.org/art_9.html
WORKDIR /root/.ssh
ADD ./authorized_keys ./

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

CMD ["/usr/bin/supervisord"]
