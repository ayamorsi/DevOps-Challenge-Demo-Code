FROM       python:3.7-alpine
RUN mkdir -p /usr/src/app
COPY --from=library/docker:latest /usr/local/bin/docker /usr/src/app/docker
COPY --from=docker/compose:latest /usr/local/bin/docker-compose //usr/src/app/docker-compose
WORKDIR /usr/src/app
COPY  .  /usr/src/app/
RUN        pip install -r requirements.txt
CMD export $(cat .env | xargs) && python hello.py