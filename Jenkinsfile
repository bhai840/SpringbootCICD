
pipeline {
    environment {
    registry = "rahulnallari/microservice-springboot"
    registryCredential = 'dockerhub'
    dockerImage = ''    
}
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
          stage ('Build_springboot_JAR') {
            steps {
                sh 'mvn clean install' 
                //sh 'mvn -Dmaven.test.failure.ignore=true install'
                //sh "docker build -t spring-boot-web:${env.BUILD_ID} ."
                
                }
            post {
                success {
                    archiveArtifacts artifacts: '**/target/*.jar' 
                    
                   }
                }
          }   
            stage ('Building_docker_images') {
                 steps{
                    script {
                        dockerImage = docker.build registry //+ ":latest"
        }
      }
    } 
        
           stage('Push_Image') {
                 steps{
                    script {
                        docker.withRegistry( '', registryCredential ) {
                             dockerImage.push()
    
                         }
                       }
                    }
     
                 }
           
           stage ("Kubernetes_deploy") {

               steps{
                //     sh "kubectl get nodes"
                       sh '''

                            kubectl apply -f https://github.com/bhai840/SpringbootCICD/blob/master/Kubernetes/Deployment.yaml -n ${Kuberntes-NameSpace}

                            kubectl apply -f https://github.com/cvemula1/java-SpringBootapp-k8s/blob/master/Kubernetes/services.yaml -n ${Kuberntes-NameSpace}

                            kubectl apply -f https://github.com/cvemula1/java-SpringBootapp-k8s/blob/master/Kubernetes/ingress.yaml
 -n ${Kuberntes-NameSpace}

                         '''
               

            }

        }
        
     
    }
}


           
