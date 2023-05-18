pipeline {
    agent any
   security:
    gitHostKeyVerificationConfiguration:
      sshHostKeyVerificationStrategy: "acceptFirstConnectionStrategy"
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sn0rlaxlife/aks-fleet-manager']]])
            }
        }
        stage('Scan with tfsec') {
            steps {
                sh 'tfsec . --no-color'
            }
            
            post {
              success {
                  // publish html
              }
                  publishHTML target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'coverage'
                    reportFiles: 'index.html',
                    reportName: 'tfsec'
                  ]
              }
            }        
        }
    }
    post {
      always {
       echo "Send notifications for result: ${currentBuild.result}"
    }
}
