pipeline{
    agents any
    stages{
        stage("Build a new version of app on new commit"){
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.var'
                    sh 'jar -cvf StudentSurvey.war -C WebContent/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh 'docker login -u nidhish98 -p nidDocker@23'
                    def customImage = docker.build("nidhish98/studentsurvey645:${BUILD_TIMESTAMP}'")
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