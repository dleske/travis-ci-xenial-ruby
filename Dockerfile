FROM travisci/ubuntu-ruby:16.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl host
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io -o rvm.sh
RUN cat rvm.sh | bash -s stable
RUN useradd -m travis -G rvm -s /bin/bash
RUN apt-get install sudo
RUN echo "travis ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# completely not sure why this is necessary or how to better deal with it
RUN echo ". /etc/profile" >> /home/travis/.bashrc

WORKDIR /home/travis
