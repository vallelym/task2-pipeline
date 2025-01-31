pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository and checkout the main branch
                git branch: 'main', url: 'https://github.com/vallelym/task2-pipeline.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                // Build the Flask and MySQL images using Buildx
                sh 'docker buildx create --use'
                sh 'docker buildx build --platform linux/amd64 -t vallelym/task2-pipeline:flask-app ./flask-app --push'
                sh 'docker buildx build --platform linux/amd64 -t vallelym/task2-pipeline:db ./db --push'
            }
        }

        stage('Run deploy.sh') {
            steps {
                // Make deploy.sh executable
                sh 'chmod +x deploy.sh'
                
                // Run deploy.sh
                sh './deploy.sh'
            }
        }
    }
}
