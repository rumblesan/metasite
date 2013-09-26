
from flask import Flask


from flask.ext.sqlalchemy import SQLAlchemy

from werkzeug.contrib.fixers import ProxyFix

import os

app = Flask('metapiano')
config = os.path.join(app.root_path, 'config', 'production.cfg')
app.config.from_pyfile(config)

app.wsgi_app = ProxyFix(app.wsgi_app)

app.debug = True

db = SQLAlchemy(app)
