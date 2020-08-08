pipeline {
    agent any
	
        tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
        dockerTool "docker"
        
    }

    stages {
    	stage('VCS') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Mahanotrahul/test.git'

            }
        }
        stage('Build') {
            steps {
                
                // Run Maven on a Unix agent.
                sh "python3 -m pip install -r requirements.txt; gunicorn app:app"
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: 'd6a27600-d94a-11ea-9d65-5583a611f3c7',
                        toolName: 'docker') {
                        
                        // Build and Push
                        def echoServerImage = docker.build("mahanotrahul/test:latest");
                        echoServerImage.push();
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
            script {
            def GIT_COMMIT_SHORT = sh(
                script: "printf \$(git rev-parse --short ${GIT_COMMIT})",
                returnStdout: true)
            def body = {"flockml":"<flockml>Apna bhi chal gaya<b>Flock</b><br>Kaafi late!!!</flockml>"}' 
            }
            response = $(curl -X POST https://api.flock.com/hooks/sendMessage/b8eeddf9-a331-4cb2-9966-664ff6fd4bcc -H "Content-Type: application/json" -d body)
            echo "$(response)"
            
        }
        failure {
            echo "Failure! Duh!"
        }
    }
}


