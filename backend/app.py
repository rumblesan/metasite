
from flask import Response, request
from core import app
from database import db, Poem

from HTMLParser import HTMLParser

import json


class MLStripper(HTMLParser):
    def __init__(self):
        self.reset()
        self.fed = []

    def handle_data(self, d):
        self.fed.append(d)

    def get_data(self):
        return ''.join(self.fed)


def strip_tags(html):
    s = MLStripper()
    s.feed(html)
    return s.get_data()


def data_response(data, status_code=200):
    return Response(
        json.dumps(data),
        status=status_code,
        mimetype='application/json'
    )


@app.route('/', methods=['GET'])
def main():
    return data_response({'status': 'running'})


@app.route('/submit/poem', methods=['POST'])
def submit_poem():

    app.logger.debug('submitting poem')

    data = request.form
    app.logger.debug(data)
    author = data['author']
    text = strip_tags(data['text'])
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
        app.logger.debug('created poem')
        db.session.add(poem)
        db.session.commit()
        return data_response(poem.info())


@app.route('/poems/latest', methods=['GET'])
def get_poems():
    last_id = int(request.args.get('latestId', '1'))
    poems = db.session.query(Poem).filter('id>%d' % last_id)
    return data_response([p.info() for p in poems])


@app.route('/poems/site', methods=['GET'])
def site_poems():
    last_id = int(request.args.get('latestId', '0'))

    q = db.session.query(Poem).order_by(Poem.id.desc())

    if last_id == 0:
        poems = q.limit(10)
    else:
        poems = q.filter('id<=%d' % last_id).limit(10)
    return data_response([p.info() for p in poems])


if __name__ == '__main__':
    app.run()
