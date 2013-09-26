
from flask import Response
from core import app

import json


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
