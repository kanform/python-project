##Check docker mtu in case of time-out failure
FROM python:3.11

ARG APP_VERSION
ENV FLASK_APP="/site/main.py"
ENV APP_VERSION=$APP_VERSION
COPY site /site
RUN apt update && apt install vim -y \
    && useradd -m kanform \
    && chown -R kanform:kanform /site

WORKDIR /site
USER kanform
RUN pip install --upgrade -r /site/requirements.txt

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=8080"]