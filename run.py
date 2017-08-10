#!/usr/bin/env python3

"""
Description:
    Runs the application
"""

from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand

from app import app, db
from scripts.test import TestCommand

migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)
manager.add_command('test', TestCommand)


if __name__ == '__main__':
    manager.run()


# end run.py
