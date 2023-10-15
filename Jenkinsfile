pipeline {
  agent any
  
  tools {
    maven '3.9.5'
  }

  options {
    buildDiscarder(logRotator(daysToKeepStr: "14", numToKeepStr: "5"))
    disableConcurrentBuilds(abortPrevious: true)
    timeout(time: 30, unit: 'MINUTES')
  }

  stages {
    stage("Build environment information") {
      steps {
        sh "whoami"
        sh "printenv"
      }
    }
    
    stage("Hello World") {
      steps {
        helloWorld()
      }
    }

    stage("Sonar") {
      steps {
        dir("java-project") {
          withSonarQubeEnv(installationName: "sonarqube") {
            sh 'mvn clean package org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'
          }
        }
      }
    }

    stage("Quality gate") {
      steps {
        timeout (time: 2, unit: "MINUTES") {
          waitForQualityGate abortPipeline: true
        }
      }
    }
  }
}
