pipeline {
    stages {
        stage('Build Trypod') {
            agent { 
                kubernetes {
                    label 'docker'
                    defaultContainer 'docker'
                }
            }
            steps {
                sh 'docker build -t trypod:latest'
            }
        }
    }
}
