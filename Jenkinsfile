pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sn0rlaxlife/aks-fleet-manager.git']]])
            }
        }

        stage('Scan with tfsec') {
            steps {
                sh 'tfsec .'
            }
        }
    }
}
