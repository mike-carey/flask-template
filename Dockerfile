###
#  Defines a docker environment
##

FROM python:latest
MAINTAINER Mike Carey <michael.r.carey@att.net>

COPY . /srv
WORKDIR /srv

RUN pip3 install -r requirements.txt
RUN make init
RUN make build

CMD ["make", "run"]

# end Dockerfile
