
from flask import Flask, Response

from werkzeug.contrib.fixers import ProxyFix

import os
import json

app = Flask('metapiano')
config = os.path.join(app.root_path, 'config', 'production.cfg')
app.config.from_pyfile(config)

app.wsgi_app = ProxyFix(app.wsgi_app)


app.debug = True


def data_response(data):
    return Response(
        json.dumps(data),
        status=200,
        mimetype='application/json'
    )


@app.route('/service/api', methods=['GET'])
def main():
    return data_response({'message': 'no data'})

if __name__ == '__main__':
    app.run()
