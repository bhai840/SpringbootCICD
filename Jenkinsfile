

pipeline {

    agent {
    node {
        label 'slave'
         }
     }
    
     tools {
        maven 'localmaven'
        jdk 'localjdk'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
          stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install'
               
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/target/*.jar' 
                }
            }
             
        }
          stage ('deploy to server on amazon') {
              steps {
                  build job: 'pipelineascode-rahul'
                  scp $WORKSPACE/target/*.jar ec2-user@34.205.89.193:/home/ec2-user/
              }
              
          }

     }

}


