FROM       python:3.7-alpine
RUN mkdir -p /usr/src/app
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
RUN sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN sudo chmod +x /usr/bin/docker-compose
WORKDIR /usr/src/app
COPY  .  /usr/src/app/
RUN        pip install -r requirements.txt
CMD export $(cat .env | xargs) && python hello.py