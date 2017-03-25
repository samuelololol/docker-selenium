FROM samuelololol/docker-selenium
MAINTAINER samuelololol <samuelololol@gmail.com>

ADD test.py /app/test.py
ADD entrypoint.sh /app/entrypoint.sh

WORKDIR /app
RUN cd /app; rm -rf chromedriver; unzip chromedriver_linux64.zip; chmod +x chromedriver
CMD /app/entrypoint.sh
