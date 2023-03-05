node {
    def app
  
        stage('Checkout') {
            
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/aatlassi/tp.git']]])
        
        }
        stage('Create Staging Branch') {
                
                    sh 'git checkout staging'

                    withCredentials([usernamePassword(credentialsId: '6cbe87ef-1f79-4211-ba7d-5cfdfdedcf54', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    // sh 'git config pull.rebase false'
                   //  sh 'git pull'
                   //  sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/aatlassi/tp.git')
                       
                   }
         }

         stage('Test application') {
               
                  sh 'python3 --version' 
                  //sh 'pip --version'
                  sh 'pip install -r requirements.txt'
                 // sh 'python3 -m pip install flask'
                  sh 'flask --app app run'  
        }

        stage('Build and push Docker Image'){

          app= docker.build("asmagr/tp-python:${env.BUILD_NUMBER}")
         
          docker.withRegistry('', 'dockerhubtp') {
            def customImage = docker.build("asmagr/tp-python:${env.BUILD_ID}")
            customImage.push()
           }
            echo "image built successfully"
        }
    
    
}

    