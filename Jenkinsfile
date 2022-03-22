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
                sh "mv /var/lib/jenkins/workspace/Development/webapp/target/*.war /var/lib/jenkins/workspace/Development/webapp/target/try.jar"
            }
        }

        stage('Copy to s3') {
            steps {
<<<<<<< HEAD
                sh "aws s3 cp /var/lib/jenkins/workspace/Development/webapp/target/try.jar s3://demokoantek-rootbucket/ohio-prod/1608692348674012/FileStore/"
=======
                sh "aws s3 cp /var/lib/jenkins/workspace/Development/webapp/target/*.jar s3://demokoantek-rootbucket/ohio-prod/2862590240439490/FileStore/"
>>>>>>> 9ca8e566fe1941a0585ce9be1dab45442e74dec7
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
