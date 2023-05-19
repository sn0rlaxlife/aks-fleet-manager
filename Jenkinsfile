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
                sh 'tfsec . --format=html > tfsec_output.html'
            }
        }
    }

    post {
        always {
            // Archive the HTML report
            archiveArtifacts artifacts: 'tfsec_output.html', fingerprint: true
        }
    }
}


