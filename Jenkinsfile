pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git 'https://github.com/vallelym/task2-pipeline.git'
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
