
from flask import Flask

from werkzeug.contrib.fixers import ProxyFix

app = Flask('metapiano')

app.wsgi_app = ProxyFix(app.wsgi_app)

app.debug = True


@app.route('/api', methods=['GET'])
def main():
    return "hello\n"

if __name__ == '__main__':
    app.run()
