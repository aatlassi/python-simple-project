pipeline {
   agent any

   environment {
        DOCKER_REGISTRY = "https://hub.docker.com/repository/docker/asmagr/tp-python"
        DOCKER_IMAGE_NAME = "asmagr/tp-python"
        DOCKER_IMAGE_TAG = "${env.BUILD_ID}"
    }
    
   stages { 
        stage('Checkout') {
           steps { 
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/aatlassi/tp.git']]])
         }
        }
        
      
        stage('Create Staging Branch') {
                steps { 
                    sh 'git checkout staging'

                    withCredentials([usernamePassword(credentialsId: 'http://ec2-13-36-37-1.eu-west-3.compute.amazonaws.com:8080/manage/credentials/store/system/domain/_/credential/0732e890-71f1-42f0-9102-967a52fca931', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    // sh 'git config pull.rebase false'
                   //  sh 'git pull'
                    sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/aatlassi/tp.git')
                       
                   }
                   } 
         }

         stage('Test application') {
               steps { 
                  sh 'python3 app.py &' 
                  sh 'python3 test_main.py'  
              }
         }


        stage('Build and push Docker Image'){

        steps { 
          script{ 
            
            docker.withRegistry('', 'dockerhubtp') {
            def customImage = docker.build("asmagr/tp-python:${env.BUILD_ID}")
            customImage.push()
           }
            echo "image built successfully"
          }
        }
        }  
    } 
    
}

    