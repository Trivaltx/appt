FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get -qq update -y \
    && apt-get -qqy --no-install-recommends install \
    ufw \
    xfce4 \
    xrdp \
    xorg \ 
    dbus-x11 \
    x11-xserver-utils \
    python3 \
    python3-pip \
    zip \
    git \
    ffmpeg \
    thunar-archive-plugin \
    firefox
    
RUN apt-get -qqy --no-install-recomendeds install xubuntu-core^
RUN sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh && \
    ufw enable -y && \
    ufw allow 3389/tcp
RUN /etc/init.d/xrdp restart
