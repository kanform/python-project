import os
import socket

from flask import Flask, render_template, send_from_directory, redirect

app = Flask(__name__)

@app.route('/')
def index():
    return redirect("index.html", code=302)

@app.route('/healthz')
def healthz():
    return render_template("healthz.html")

@app.route('/static/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
      'img/favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route("/<p>", methods=['GET', 'POST', 'PUT'])
def layout(p):
    try:
        return render_template("layout.html", page=p,
                               APP_VERSION=os.getenv('APP_VERSION'),
                               HOSTNAME=os.getenv('HOSTNAME'),
                               POD_IP=socket.gethostbyname(socket.gethostname()))
    except Exception as e:
        return render_template("layout.html", page='404.html', exception=e)

@app.errorhandler(404)
def not_found():
    return render_template("layout.html", page='404.html')


if __name__ == '__main__':
    layout()
