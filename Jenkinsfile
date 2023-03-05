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

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", "-f Dockerfile .")
                }
            }
        }
        
      


        stage('Build and push Docker Image'){

        steps { 
          script{ 
            
            docker.withRegistry('', '05e7f4ce-d0a6-44ac-a080-be3aba651c29') {
            def customImage = docker.build("asmagr/tp-python:${env.BUILD_ID}")
            customImage.push()
           }
            echo "image built successfully"
          }
        }
        }  
    } 
    
}

    