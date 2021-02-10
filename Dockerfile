FROM alpine:3.13.1

ADD sensu-go/bin/sensu-agent /bin/sensu-agent
ADD sensu-go/bin/sensu-backend /bin/sensu-backend
ADD sensu-go/bin/sensuctl /bin/sensuctl