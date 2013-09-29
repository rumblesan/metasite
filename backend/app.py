
from flask import Response, request
from core import app
from database import db, Poem

import json


def data_response(data, status_code=200):
    return Response(
        json.dumps(data),
        status=status_code,
        mimetype='application/json'
    )


@app.route('/service/api', methods=['GET'])
def main():
    return data_response({'message': 'no data'})


@app.route('/submit/poem', methods=['POST'])
def submit_poem():
    if request.headers['Content-Type'] != 'application/json':
        data_response({
            'status': 'error',
            'message': 'Please submit json'
        }, 400)

    data = json.loads(request.data)
    author = data['author']
    text = data['text']
    if not author:
        data_response({
            'status': 'error',
            'message': 'Please submit an author name'
        }, 400)
    elif not text:
        data_response({
            'status': 'error',
            'message': 'Please submit the poem text'
        }, 400)
    else:
        poem = Poem(author, text)
        db.session.add(poem)
        db.session.commit()
        return data_response(poem.info())


@app.route('/poems/latest', methods=['GET'])
def get_poems():
    last_id = int(request.args.get('latestId', '1'))
    poems = db.session.query(Poem).filter('id>%d' % last_id)
    return data_response([p.info() for p in poems])


if __name__ == '__main__':
    app.run()
