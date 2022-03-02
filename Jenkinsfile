pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('check out') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/sumanthram348/helloworld-24022022.git'

            }
        }
		stage('Build') {
			steps {
				sh "mvn clean package"
            }
        }
        
        stage('copy to s3') {
            steps {
                sh "aws s3 cp /var/lib/jenkins/workspace/helloworld/webapp/target/*.war s3://demokoantek-rootbucket/ohio-prod/485375597575650/FileStore/tables/" 
            }
        }
    }
}

