

pipeline {

    agent any

    stages{

        stage('Build'){
            steps {
              echo 'install clean maven packages'  
              sh 'mvn clean install'  
                
            }

        }

        post {
            success {
                echo 'Now Archiving....'
                sh 'make'
                archiveArtifacts artifacts: '**/target/*.jar'
            }
        }

                        
        stage('Deploy'){
            steps {
                echo 'copying file to remote server'
                scp $WORKSPACE/target/*.jar ec2-user@52.204.85.45:/home/ec2-user/
                
            }

        }


    }

}
