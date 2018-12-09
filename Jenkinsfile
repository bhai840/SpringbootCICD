

pipeline {

    agent any// { any
   // node {
  //      label 'slave'
   //      }
   //  }
     tools {
        maven 'localmaven'
         
        //jdk 'localjdk'
        jdk 'Local_Java'
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
         

     }

}


