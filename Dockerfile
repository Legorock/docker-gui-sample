
FROM ubuntu:20.04

ARG USER=default
ARG PASSW=default

# ARG XAUTH_TOKEN

# localtime setup necessary for "tzdata"!
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y \
 && apt-get install -y sudo neovim locales firefox xauth

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
 && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Setup a default user
RUN groupadd -g 1000 $USER \
 && useradd -d /home/$USER -s /bin/bash -m $USER -u 1000 -g 1000 \
 && echo 'default:default' | chpasswd
RUN adduser $USER sudo

# This authenticate the container to access the X Server
# Use `xauth list` on the host and provide the result in $XAUTH_TOKEN
# RUN xauth add $XAUTH_TOKEN

USER $USER
ENV HOME /home/$USER


WORKDIR $HOME
CMD ["/usr/bin/firefox"]
