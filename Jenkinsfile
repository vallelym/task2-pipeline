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
                // Build the Flask and MySQL images
                sh 'docker build -t vallelym/task2-pipeline:flask-app ./flask-app'
                sh 'docker build -t vallelym/task2-pipeline:db ./db'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"

                    // Push the images
                    sh 'docker push vallelym/task2-pipeline:flask-app'
                    sh 'docker push vallelym/task2-pipeline:db'
                }
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
