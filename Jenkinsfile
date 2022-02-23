pipeline
{
    agent {
        label 'OneS1'
    }
    
    environment {
        envString = 'true'
    }
 
    post {
        always {
            allure includeProperties: false, jdk: '', results: [[path: 'out/syntax-check/allure'], [path: 'out/smoke/allure']]
            junit allowEmptyResults: true, testResults: 'out/syntax-check/junit/junit.xml'
            junit allowEmptyResults: true, testResults: 'out/smoke/junit/*.xml'
        }
    
        failure {
            bat "echo failure"
        }
        
        success {
            bat "echo success"      
        }
    }
    stages {
        stage("syntax-check") {
            steps {
                script{
                    try {
                        bat "chcp 65001 \n vrunner syntax-check"
                    } catch(Exception Exc) {
                            currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }
        stage("Smoke test") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n runner xunit"
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }
        stage("Sonar") {
            steps {
                script{
                    scannerHome = tool 'sonar-scaner'
                    
                }
                withSonarQubeEnv ("sonar") {
                bat "${scannerHome}/bin/sonar-scanner -D sonar.login=620b0758a7f56314569a4c347fcb1218992764c5 -D sonar.projectVersion=${BUILD_ID}"
                }
 
            }
        }

    
    }
}
