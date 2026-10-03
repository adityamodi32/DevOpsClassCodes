@Library('mySharedLib') _

pipeline {
    agent any
    
    tools {
        maven 'Maven-3.9.9' 
    }

    stages {
        stage('Checkout Source') {
            steps {
                gitCheckout()
            }
        }
        
        stage('Execute Maven Build via Shared Library') {
            steps {
                mavenBuild()
            }
        }
    }
    
    post {
        success {
            // Wrapped in script block and passing the required message string
            script {
                emailNotification.successEmail()
            }
        }
        failure {
            // Wrapped in script block and passing the required message string
            script {
                emailNotification.failureEmail()
            }
        }
    }
}

// Live Webhook Verification Run - Build #2
