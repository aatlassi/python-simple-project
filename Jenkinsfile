node {
    def app
  
        stage('Checkout') {
            
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/username/repo.git']]])
        
        }
        stage('Create Staging Branch') {
            
                sh 'git checkout -b staging'
                sh 'git push -u origin staging'
            
        }

         stage('Test application') {
           
                  withPythonEnv('python3') {
                  sh 'python --version' 
                  sh 'pip install -r requirements.txt'
                  sh 'flask --app app run'
                  }     
            
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

    