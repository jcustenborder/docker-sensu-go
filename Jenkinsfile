#!groovy

node {
    checkout(scm)
    def dockerImage = "docker.custenborder.com/jcustenborder/docker-jenkins-golang:main-2"

    sh "git clone https://github.com/sensu/sensu-go.git"

    withDockerRegistry(credentialsId: 'custenborder_docker', url: 'https://docker.custenborder.com') {

        docker.image(dockerImage).inside() {

            dir("sensu-go") {
                sh "go build -o bin/sensu-agent ./cmd/sensu-agent"
                sh "go build -o bin/sensu-backend ./cmd/sensu-backend"
                sh "go build -o bin/sensuctl ./cmd/sensuctl"
                sh "ls -1 bin"
            }
        }
    }
}