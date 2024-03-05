pipeline {
    agent any

    stages {
        stage('Clone code') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shahasakshi/hello-devops-project.git']])    
                }
            }
        stage('Build') {
            steps {
                //bat 'dir && mvn clean package'
                bat 'docker build -t sakshi9912/java .'
            }
        }
        stage('login & Push to Docker Hub') {
                steps {
                    script {
                  withCredentials([string(credentialsId: 'dockerhubpass', variable: 'dockepass')]) {
                  bat "docker login -u sakshi9912 -p ${dockepass}"
                    }
                bat "docker push sakshi9912/java"
                }
                 echo 'Push to Docker Hub Completed'
            }
        }          
    }
        
}