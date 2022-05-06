
pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t simplihenz2/devopshenz:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push simplihenz2/devopshenz:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
