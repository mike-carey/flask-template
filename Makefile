###
# Defines entry points for the project
##

ENTRY = python3 run.py
SECRET_KEY = APP_SECRET


help:
	@echo "Usage \`make [command]\` where command is one of the following:"
	@echo "  help           Prints this help message"
	@echo "  init           Copies .env.example as .env and creates a secret"
	@echo "  secret         Creates a new secret in the .env file"
	@echo "  build          Builds the application"
	@echo "  lint           Runs the linter"
	@echo "  shell          Starts a shell for entering the application"
	@echo "  run            Starts the application"
	@echo "  test           Runs the testing suite"
	@echo "  db             Upgrades the database"
	@echo "  deploy         Deploys the application"
	@echo "  docker         Run the docker image"
	@echo "  docker-shell   Run a shell in a docker image"
	@echo ""
# help


init:
	[ -f .env ] || cp .env.example .env
	$(MAKE) secret
	mkdir -p instance
	touch instance/__init__.py
	[ -f instance/config.py ] || cp config.py instance/config.py
# init


secret:
	grep -q "^$(SECRET_KEY)=$$" .env && sed -i "s/$(SECRET_KEY)=/$(SECRET_KEY)="$$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"/g" .env
# secret


build:
	@echo "Building"
# build


lint:
	@flake8
# lint


shell:
	$(ENTRY) shell
# shell


run:
	$(ENTRY) runserver
# start


test:
	$(ENTRY) test --quiet
# test


db:
	$(ENTRY) db upgrade
# migrate


deploy:
	@echo "Deploying"
# deploy


docker:
	docker-compose up -d
# docker


docker-shell:
	docker-compose run app bash
# end docker-shell


# end Makefile
