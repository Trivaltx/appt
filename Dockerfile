FROM ubuntu 18.04
RUN echo "## atualizando repositorios..."
RUN apt-get -qq update -y
RUN echo "## instalando interface grafica..."
RUN apt-get -qq install xubuntu-core^ -y
RUN echo "## instalando demais programas/dependencias..."
RUN apt-get -qq install xfce4 --no-install-recommends -y
RUN apt-get -qq install xrdp xorg dbus-x11 x11-xserver-utils python3 python3-pip zip git ffmpeg thunar-archive-plugin firefox -y
RUN echo "## terminando as configurações..."
RUN sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
RUN ufw allow 3389/tcp
RUN /etc/init.d/xrdp restart
