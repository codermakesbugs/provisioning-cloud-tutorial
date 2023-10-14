pipeline {
  agent any
  
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
  }
}
