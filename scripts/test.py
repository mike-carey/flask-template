"""
Description:
    Simply wraps nosetests into a command for Flask-Scripts
"""

import nose
import logging

from flask_script import Command, Option

from app import app


class TestCommand(Command):

    name = "test"

    capture_all_args = True

    def get_options(self):
        return [
            Option("-q", "--quiet", dest="quiet", default=False, action="store_true", help="The app logger will be set to ERROR level")
        ]
    # end def get_options

    def run(self, argv, quiet=False):
        if (quiet):
            app.logger.setLevel(logging.ERROR)

        argv = list(argv)
        argv.append("tests")

        nose.run(argv=argv)
    # end def run


# end test.py
