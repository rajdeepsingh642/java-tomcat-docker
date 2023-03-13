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
        
    
    
              sh 'scp -o StrictHostKeyChecking=no tomcat.yml ansible.yml rajdeep@192.168.1.76:/home/rajdeep/raj'
             script{
                   try{        
                      sh "ssh rajdeep@192.168.1.76 ansible-playbook -i /home/rajdeep/raj/ansible.yml -b"
                     }catch(error)
                        {

                        }
            
            
            
            }
                }
            }
            }
}
}

