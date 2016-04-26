# modified from https://github.com/dockerfiles/django-uwsgi-nginx
FROM debian:jessie

MAINTAINER Dockerfiles

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y supervisor 
RUN easy_install pip

RUN apt-get install -y build-essential
RUN apt-get install -y libmysqld-dev
RUN pip install -U meinheld gunicorn

ADD requirements.txt /home/docker/code/
RUN pip install -r /home/docker/code/requirements.txt

ADD . /home/docker/code/

RUN ln -s /home/docker/code/supervisor-app.conf /etc/supervisor/conf.d/

ENTRYPOINT ["/home/docker/code/run.sh"]
#CMD ["supervisord", "-n"]
CMD ["sh", "-c"]
