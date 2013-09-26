#!/usr/bin/env python

from core import app, db

from flask.ext.script import Manager
from flask.ext.migrate import Migrate, MigrateCommand


migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)


class Poem(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    author = db.Column(db.String(32))
    text = db.Column(db.Text)

    def __init__(self, author, text):
        self.author = author
        self.text = text

    def info(self):
        return {
            'id': self.id,
            'author': self.author,
            'text': self.text
            }

if __name__ == '__main__':
    manager.run()
