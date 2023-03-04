pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/username/repo.git']]])
            }
        }
        stage('Create Staging Branch') {
            steps {
                sh 'git checkout -b staging'
                sh 'git push -u origin staging'
            }
        }
    }
}

    Push the new branch to the repository. Use the sh step to execute the git push command to push the new branch to the remote repository.

lua

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/asmaEfrei/tp-python.git']]])
            }
        }
        stage('Create Staging Branch') {
            steps {
                sh 'git checkout -b staging'
                sh 'git push -u origin staging'
            }
        }
    }
 }

