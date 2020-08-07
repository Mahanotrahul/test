pipeline {
    agent { docker { image 'python:3.5.1' } }


    stages {
    stage('Checkout ') {
  steps {
    checkout([
      $class: 'GitSCM',
      branches: [[name: 'master']],
      userRemoteConfigs: [[
        url: 'git@github.com:wshihadeh/rabbitmq_client.git',
        credentialsId: 'd51ca0cd1fab5723ddb371496fd34f1683bec9c6',
      ]]
     ])
   }
}
        stage('VCS') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Mahanotrahul/test.git'

            }
        }
        stage('Build') {
            steps {
                
                // Run Maven on a Unix agent.
                sh "python3 -m pip install -r requirements.txt; python3 app.py"
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: 'd51ca0cd1fab5723ddb371496fd34f1683bec9c6',
                        toolName: 'docker') {
                        
                        // Build and Push
                        def echoServerImage = docker.build("mahanotrahul/test:latest");
                        test.push();
                    }
                }
            }
        }
    }
    post {
        // If Maven was able to run the tests, even if some of the test
        // failed, record the test results and archive the jar file.
        success {
            echo "Success"
        }
        failure {
            echo "Failure! Duh!"
        }
    }
}


