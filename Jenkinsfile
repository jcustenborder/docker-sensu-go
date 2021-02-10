#!groovy

node {
    deleteDir()
    checkout(scm)
    def buildImage = "docker.custenborder.com/jcustenborder/docker-jenkins-golang:main-2"

    sh "git clone https://github.com/sensu/sensu-go.git"

    withDockerRegistry(credentialsId: 'custenborder_docker', url: 'https://docker.custenborder.com') {
        docker.image(buildImage).inside() {
            dir("sensu-go") {
                sh "go build -o bin/sensu-agent ./cmd/sensu-agent"
                sh "go build -o bin/sensu-backend ./cmd/sensu-backend"
                sh "go build -o bin/sensuctl ./cmd/sensuctl"
                archiveArtifacts artifacts: 'bin/sensu*', followSymlinks: false
            }
        }
    }

    def dockerImage = "jcustenborder/sensu-go"
    def image = docker.build("jcustenborder/sensu-go:latest")
    withDockerRegistry(credentialsId: 'hub.docker.com', url: "") {
        image.push()
    }
}