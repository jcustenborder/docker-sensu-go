FROM golang:1.15.8-alpine

ADD sensu-go/bin/sensu-agent /bin/sensu-agent
ADD sensu-go/bin/sensu-backend /bin/sensu-backend
ADD sensu-go/bin/sensuctl /bin/sensuctl