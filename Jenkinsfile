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

        stage('Deploy') { 
            steps {
                script{
                    sh "echo ${env.PRIVATE_KEY} >> ~/.ssh/ansible_rsa"
                    sh  "ansible-galaxy install --roles-path=roles -r requirements.yml"
                }
            }
        }

        stage('Run unittests') {
            steps {
                script {
                    docker.image("${env.IMAGE_NAME}").withRun {c ->
                    docker.image("${env.IMAGE_NAME}").inside{
                          sh "coverage run -m pytest"
                          sh "coverage report"
                        }
                    }
                }
            }
        }                                                                           
    }
}        

