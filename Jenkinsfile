
pipeline{
    agent any

    environment{
        ACTION = "${params.ACTION}"
    }


    parameters {


		choice (name: 'ACTION',
				choices: [ 'plan', 'apply', 'destroy'],
				description: 'Run terraform plan / apply / destroy')


    }

    stages {
        stage("init"){
            steps{
	        withCredentials([usernamePassword(credentialsId: 'az_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
		sh 'az login -u $USERNAME -p $USERPASS'
                sh 'terraform init'
		
		}

            }
        }

        stage("plan"){
            when { anyOf
				{
					environment name: 'ACTION', value: 'plan';
					environment name: 'ACTION', value: 'apply'
				}
			}
            steps{
                sh 'terraform plan -out=tfplan'

            }
        }


        stage("apply"){
            when { anyOf
				{
					environment name: 'ACTION', value: 'apply'
				}
			}
            steps{
                sh 'terraform apply tfplan'

            }
        }

        stage("destroy"){
            when { anyOf
				{
					environment name: 'ACTION', value: 'destroy'
				}
			}
            steps{
                sh 'terraform destroy --auto-approve'

            }
        }
    }
}
