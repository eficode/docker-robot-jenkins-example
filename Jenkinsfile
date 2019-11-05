pipeline {
  agent {
    label 'docker'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Robot tests') {
      steps {
        sh "docker-compose run robot"
      }
    }

  }

  post {
    always {
      step([$class: 'RobotPublisher',
            disableArchiveOutput: false,
            logFileName: 'results/log.html',
            onlyCritical: true,
            otherFiles: 'results/*.png',
            outputFileName: 'results/output.xml',
            outputPath: '.',
            passThreshold: 90,
            reportFileName: 'results/report.html',
            unstableThreshold: 100
            ])
    }
  }
}
