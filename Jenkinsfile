pipeline {
    agent any
    stages {
        stage('clean') {
            steps {
                          bat "mvn clean"
            }
        }
        stage('validate') {
            steps {
                          bat "mvn validate"
            }
        }
        stage('build') {
                steps {
                            bat "mvn compile"
                }
            }
        stage('Test') {
            steps {
                bat "mvn test"
            }
        }
        stage('Package') {
                steps {
                    bat "mvn package"
                }
            }
//         stage('Deploy') {
//             steps {
//             script {
//              deploy adapters: [tomcat8(url: 'http://localhost:8080/', credentialsId: '')], war: '**/*.war', contextPath: '/Etablissement-scolaire'
//             }
//             }
//         }
    }
}