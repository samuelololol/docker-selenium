FROM samuelololol/docker-ubuntu1604-python:v0.1
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" > /etc/apt/sources.list.d//mozillateam-firefox.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE49EC21
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip wget libxss1 \
                       libappindicator1 libindicator7 libnss3 \
                       libgconf-2-4 libpango1.0 xdg-utils \
                       fonts-liberation unzip
RUN pip install --upgrade pip
RUN pip install selenium PyVirtualDisplay xvfbwrapper

# add google-chrome & chromedriver
RUN mkdir /app
RUN cd /app; wget -N http://chromedriver.storage.googleapis.com/2.24/chromedriver_linux64.zip
RUN cd /app; wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# ADD chromedriver_linux64_2.24.zip /app/chromedriver_linux64_2.24.zip
# ADD google-chrome-stable_current_amd64.deb /app/google-chrome-stable_current_amd64.deb
RUN cd /app; dpkg -i google-chrome*.deb
RUN cd /app; apt-get install -f
WORKDIR /app
