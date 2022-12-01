from flask import Flask, render_template, session, make_response

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("layout.html", page="index.html")

@app.route('/healthz')
def healthz():
    return render_template("healthz.html")

@app.route("/<p>", methods=['GET', 'POST', 'PUT'])
def layout(p):
    return render_template("layout.html", page=p, templates_vars=session.get('test'))

@app.errorhandler(404)
def not_found():
    return render_template("layout.html", page='404.html', templates_vars=session.get('test'))


if __name__ == '__main__':
    layout()
