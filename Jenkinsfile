pipeline{
    agent any
    environment {
        DOCKERHUB_PASS = credentials('docker-pass')
    }
    stages{
        stage("Build a new version of app on new commit"){
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.var'
                    sh 'jar -cvf mypart2project.war -C src/main/webapp .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh 'docker -v'
                    sh "docker login -u nidhish98 -p nidDocker@23"
                    def customImage = docker.build("nidhish98/studentsurvey645:${BUILD_TIMESTAMP}")
                }
            }
        }
        stage("Push image to docker hub"){
            steps{
                script{
                    sh 'docker push nidhish98/studentsurvey645:${BUILD_TIMESTAMP}'
                }
            }
        }
    }
}
