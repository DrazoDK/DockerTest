# https://docs.docker.com/examples/running_ssh_service/

FROM ubuntu:14.04

RUN apt-get update -y

# Install SSH server
RUN sudo apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# Enable password login
#RUN echo 'root:screencast' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ADD id_rsa.pub /tmp/your_key.pub
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
RUN cat /tmp/your_key.pub >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

## http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/
### Setup home environment
#RUN adduser --disabled-password --gecos "" vagrant
##RUN useradd vagrant
#RUN mkdir -p /home/vagrant/.ssh && chmod 700 /home/vagrant/.ssh
#RUN cat /tmp/your_key.pub >> /home/vagrant/.ssh/authorized_keys && chmod 600 /home/vagrant/.ssh/authorized_keys
#RUN chown -R vagrant:vagrant /home/vagrant
#ENV PATH /home/vagrant/bin:$PATH
#
#RUN rm -f /tmp/your_key.pub

EXPOSE 22
