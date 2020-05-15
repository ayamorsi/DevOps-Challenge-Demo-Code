FROM       python:3.7-alpine
RUN mkdir -p /usr/bin/app
COPY --from=library/docker:latest /usr/local/bin/docker /usr/bin/docker
COPY --from=docker/compose:latest /usr/local/bin/docker-compose /usr/bin/docker-compose
WORKDIR /usr/bin/
COPY  .  /usr/bin/app/
RUN        pip install -r requirements.txt
CMD docker run -v /var/run/docker.sock:/var/run/docker.sock ...
CMD export $(cat .env | xargs) && python hello.py