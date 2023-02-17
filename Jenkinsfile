pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh 'kubectl apply -f deploy.yml'
                        
                    }
                }
                        
                        
            }
        }
    }
}
