###
#  Defines configiration variables to load into the app
##

import os


LOGGER_HANDLER_POLICY = "error"

SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_DATABASE_URI = os.environ["MYSQL_DATABASE_URI"] if "MYSQL_DATABASE_URI" in os.environ else None


# end config.py
