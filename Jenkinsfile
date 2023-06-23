pipeline {
    agent any

    stages {
         
        stage('Build')   {
             steps {
                 sh 'docker-compose build'
             }
         }
         
        stage('run containers') {
             steps {
                sh 'docker-compose up -d'
             }
             
         }

    }
}
