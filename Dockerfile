FROM python:3.11

ENV FLASK_APP="/site/main.py"
COPY (main.py requirement.txt static templates) /site
RUN pip install --upgrade -r /site/requirement.txt

CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]