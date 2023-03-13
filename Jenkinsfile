pipeline{
    agent any
    tools {
        maven 'mymaven'
    }
    stages{
        stage('git checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/rajdeepsingh642/java-tomcat-docker.git'
            }
        }
        stage('maven build'){
            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
        }
      
        stage('build image'){
            steps{
                sh "docker build -t rajdeepsingh642/$JOB_NAME:v1.$BUILD_ID ."

            }
        }
         stage('image push'){
            steps{
                withCredentials([string(credentialsId: 'dockerhub', variable: 'docker_hub')]) {
              sh "docker login -u rajdeepsingh642 -p ${docker_hub}"    
             sh "docker push rajdeepsingh642/$JOB_NAME:v1.$BUILD_ID"
}

            }
         }
            stage('Deploy to K8s'){
  
            steps{
                 sshagent(['tomcat']) {
        
    
    
             sh 'scp  -o StrictHostKeyChecking=no tomcat.yml rajdeep@192.168.1.76:/opt'
             sh 'ssh rajdeep@192.168.1.76 kubectl apply -f /opt/tomcat.yml'
         }
            }
                }
}
}

