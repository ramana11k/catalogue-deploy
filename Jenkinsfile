pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }

    //  environment { 
    //     packageVersion = ''
    //     nexusURL = '172.31.0.237:8081'
    // }

    options {
        ansiColor('xterm')
        timeout(time: 1, unit: 'HOURS') 
        disableConcurrentBuilds() //It wont allow two builds at a time
    }


    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: '', description: 'What is the environment?')        
    }
   
    //BUILD
    stages {               
        stage('Print version') {
            steps {
                sh """
                    echo "artifact version is : ${params.version}"
                    echo "environment is : ${params.environment}"
                """
            }
        }

        stage('Init') {
            steps {
                sh """
                   cd terraform
                   terraform init --backend-config=${params.environment}/backend.tf -reconfigure                   
                """
            }
        }

        stage('Plan') {
            steps {
                sh """
                   cd terraform
                   terraform plan -var-file=${params.environment}/${params.environment}.tfvars
                   -var="app_version=${params.version}"
                """
            }
        }

        stage('Apply') {
            steps {
                sh """
                   cd terraform
                   terraform apply -var-file=${params.environment}/${params.environment}.tfvars
                   -var="app_version=${params.version}" -auto-approve
                """
            }
        }
    }
    
    // POST BUILD
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }

        failure { 
            echo 'this runs when pipeline is failed, used generally to send alerts'
        }
        success { 
            echo 'I will always say Hello when pipeline is success'
        }
    }
}
        
        // stage('Deploy') {
        //     steps {
        //         script {
        //             def packageJson = readJSON file: 'package.json'
        //             packageVersion = packageJson.version
        //             echo "application version: ${packageVersion}"
        //         }
                    
        //     }
        // }

        // stage('Install dependencies') {
        //     steps {
        //         script {
        //             sh """
        //                 npm install
        //             """
        //         }
                    
        //     }
        // }
                
        // stage('Build') {
        //     steps {
        //         sh """
        //             ls -la
        //             zip -q -r catalogue.zip ./* -x ".git" -x "*.zip"
        //             ls -ltr
        //         """
        //     }
        // }
        
        // stage('Publish Artifact') {
        //     steps {
        //         nexusArtifactUploader(
        //             nexusVersion: 'nexus3',
        //             protocol: 'http',
        //             nexusUrl: "${nexusURL}",
        //             groupId: 'com.roboshop',
        //             version: "${packageVersion}",
        //             repository: 'catalogue',
        //             credentialsId: 'nexus-auth',
        //             artifacts: [
        //                 [artifactId: 'catalogue',
        //                 classifier: '',
        //                 file: 'catalogue.zip',
        //                 type: 'zip']
        //             ]
        //         )
                
        //     }
     
        // }

        // stage('Deploy') {
        //     steps {
        //         sh """
        //             echo "Here  I wrote shell script"        
        //             # sleep 10            
        //         """
        //     }     
        // }
       

    