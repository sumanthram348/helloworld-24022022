pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
        terraform "terraform-11"
    }
    
    environment {
        DEV_HOST = credentials('devhost')
        DEV_TOKEN = credentials('devtoken')
    }
    
    stages {
        stage('Check out') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/sumanthram348/helloworld-24022022.git'

            }
        }
        stage('Build') {
            steps {
                sh "mvn clean package"
                sh "mv /var/lib/jenkins/workspace/Development/webapp/target/*.war /var/lib/jenkins/workspace/Development/webapp/target/*.jar"
            }
        }

        stage('Copy to s3') {
            steps {
                sh "aws s3 cp /var/lib/jenkins/workspace/Development/webapp/target/*.jar s3://demokoantek-rootbucket/ohio-prod/1608692348674012/FileStore/"
            }
        }
        
        stage('Terraform library install') {
            steps {
                dir('/var/lib/jenkins/workspace/Development/terraform') {
                    sh """
                    export DATABRICKS_HOST=${DEV_HOST}
                    export DATABRICKS_TOKEN=${DEV_TOKEN}
                    terraform init
                    terraform validate
                    terraform plan
                    terraform apply -auto-approve
                    """
            }
        }
    }
}

}
