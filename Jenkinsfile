pipeline {
agent {
  label 'unittest'
}
environment {
      IMAGE_NAME = "www123vika123/epam"
      EXTERNAL_PORT = 10005
      EXTERNAL_ADDRESS = '192.168.0.102'
      CONTAINER_NAME = "calculator"
    }

    stages {

        stage('Checkout code') { 
            steps {
                checkout scm
                script { 
                    sh 'printenv'
                    sh "ls -al && pwd"
                }
            }
            
        }   

        stage('Instal depen-s') { 
            steps {
                script {
                    sh "ls && pwd"
                    sh "ansible-galaxy install --roles-path=roles -r requirements.yml"
                }      
            }
        }

        stage('Deploy') { 
            steps {
                ansiblePlaybook playbook: 'side.yml', inventory: 'myhosts.ini', credentialsId: 'ansible_key'
            }
        }

        stage('Run tests') {
            steps {
                script {
                 sh "cat global_vars/vars.yml && ls && pwd"   
                 sh "/bin/bash tests.sh"
                }
            }
        }
    }

    post {
        always {
           cleanWs cleanWhenNotBuilt: true, notFailBuild: true
        }
    }
}
