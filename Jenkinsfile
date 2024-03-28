pipeline {
    agent any

    stages {
        stage('Clone code') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shahasakshi/hello-devops-project.git']])    
                }
            }
             stage('maven-Build') {
                        steps {
                            //bat 'dir && mvn clean package'
                            bat 'mvn clean package'
                        }
                    }
        stage('sonarqube-analysis'){
             steps{
                  script{
                     withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                         bat "mvn sonar:sonar"
                     }
                  }
               }
             }
        stage('docker-Build') {
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