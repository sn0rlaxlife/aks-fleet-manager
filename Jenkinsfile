pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sn0rlaxlife/aks-fleet-manager.git']]])
            }
        }

        stage('Run tfsec') {
            agent {
                label 'label'
            }

            steps {
                sh 'tfsec . > tfsec-report.txt'
            }
        }

        stage('Generate HTML report') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: '.', reportFiles: 'tfsec-report.txt', reportName: 'TFSec Report'])
            }
        }
    }
}

