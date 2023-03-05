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

    