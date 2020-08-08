# Clone our private GitHub Repository
FROM ubuntu
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN python -m pip -r requirements.txt
#RUN "curl -X POST https://api.flock.com/hooks/sendMessage/b8eeddf9-a331-4cb2-9966-664ff6fd4bcc -H "Content-Type: application/json" -d '{"flockml":"<flockml>Hello! Welcome to <b>Flock</b>!</flockml>"}'"

CMD cd /usr/src/app; gunicorn app:app
