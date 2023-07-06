FROM python:3.9
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get -y install htop curl tmux
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --noinput

CMD uwsgi --http=0.0.0.0:80 --module=backend.wsgi --daemonize /var/log/uwsgi.log && tail -f /dev/null
