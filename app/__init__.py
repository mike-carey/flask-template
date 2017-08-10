"""
Description:
    Creates the Flask application.
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

# Load configs
app.config.from_object("config")
app.config.from_object("instance.config")

db = SQLAlchemy(app)


if __name__ == '__main__':
    app.run()


# end __init__.py
