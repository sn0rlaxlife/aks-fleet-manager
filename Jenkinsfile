pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sn0rlaxlife/aks-fleet-manager.git']]])
            }
        }

        stage('Run tfsec') {        
            steps {
                sh 'tfsec . --no-color'
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


