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
         stage('deploy-war'){
            steps{
                sshagent(['tomcat']) {

                sh """
                scp -o StrictHostKeyChecking=no target/myweb.war rajdeep@192.168.1.76:/opt/tomcat/webapps/
                  """    
             }
            
         }   
    }
                }
}
