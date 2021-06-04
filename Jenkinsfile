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
        stage('Deploy') {
            steps {
            script {
//              deploy adapters: [tomcat7(credentialsId: '3d4ffaf7-a7a1-4f22-bbaa-1b03024e1c2b', path: '', url: 'http://localhost:8081/')], contextPath: '/job7ETC', war: '**/*.war'
             deploy adapters: [tomcat7(credentialsId: '3d4ffaf7-a7a1-4f22-bbaa-1b03024e1c2b', path: '', url: 'http://localhost:8081/')], contextPath: '/EtablissementScolaire-presentation-1.0-SNAPSHOT', war: '**/*.war'
            }
            }
        }
    }
}