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
       
      
        
            stage('Deploy to K8s'){
  
            steps{
                 sshagent(['tomcat']) {
        
    
    
             sh 'scp  -r -o StrictHostKeyChecking=no tomcat.yml rajdeep@192.168.1.76:/opt'
             script{
                try{        
                   sh 'ssh rajdeep@192.168.1.76 kubectl apply -f /opt/tomcat.yml'
         }catch(error)
            }
                }
            }
            }
}
}

