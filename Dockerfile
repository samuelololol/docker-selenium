FROM samuelololol/docker-ubuntu1604-python:v0.1
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" > /etc/apt/sources.list.d//mozillateam-firefox.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE49EC21
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip wget libxss1 \
                       libappindicator1 libindicator7 libnss3 \
                       libgconf-2-4 libpango1.0 xdg-utils \
                       build-essential chrpath libssl-dev libxft-dev \
                       libfreetype6 libfreetype6-dev \
                       libfontconfig1 libfontconfig1-dev \
                       fonts-liberation unzip &&\
    pip install --upgrade pip &&\
    pip install selenium PyVirtualDisplay xvfbwrapper &&\
    mkdir /app &&\
    cd /app &&\
    wget -N http://chromedriver.storage.googleapis.com/2.24/chromedriver_linux64.zip &&\
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
    dpkg -i google-chrome*.deb &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /var/lib/apt-lists/*
WORKDIR /app
