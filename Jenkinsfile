pipeline {
agent {
  label 'unittest'
}
environment {
      IMAGE_NAME = "www123vika123/epam"
    }
    options {
      parallelsAlwaysFailFast()
    }

    stages {

        stage('Checkout code') { 
            steps {
                checkout scm
                script {
                    sh "ls -al && pwd"
                }
            }
            
        }   

        stage('Instal depen-s') { 
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ansible_key', keyFileVariable: 'PRIVATE')]) {
                    sh  "ansible-galaxy install --roles-path=roles -r requirements.yml"
                }
            }
        }

        stage('Deploy') { 
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ansible_key', keyFileVariable: 'PRIVATE')]) {
                    sh  "ansible-playbook side.yml -K -vv --private-key $PRIVATE"
                }
            }
        }

        stage('Run tests') {
            steps {
                script {
                 sh "/bin/bash tests.sh"
                }
            }
        }                                                                           
    }
}        

