
pipeline{
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-pass')
	}
  stages{
    stage('Build') {
      steps {
        sh 'docker build -t nidhish98/studentsurvey645:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
       }
    }
    stage("Push image to docker hub"){
      steps {
        sh 'docker push nidhish98/studentsurvey645:latest'
      }
    }
  }
  post {
	  always {
			sh 'docker logout'
		}
	}    
}
