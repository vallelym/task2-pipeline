pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = 'vallelym/task2-pipeline'
    
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository and checkout the main branch
                git branch: 'main', url: 'https://github.com/vallelym/task2-pipeline.git'
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
        
        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def app = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                        app.push()
                    }
                }
            }
        }
    }
    
