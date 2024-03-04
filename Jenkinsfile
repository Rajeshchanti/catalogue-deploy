pipeline{
    agent {
        node {
            label 'agent-1'
        }
    }
    // environment {
    //     packageVersion=''
    //     nexusURL='44.195.87.69:8081' //prot No: 8081
    // }
    options{
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters { // sending these details to ansible
        string(name: 'version' , defaultValue: '', description: 'what is the artifact version?')
        string(name: 'environment' , defaultValue: '', description: 'which environment?')
    }
    stages{
        stage('print the Version') {
            steps{
                sh """
                    echo "version: ${params.version}"
                """
            }
        }
    post {
        always {
            echo 'job is done'
            deleteDir()
        }
        failure {
            echo 'Build is Failed'
        }
        success {
            echo 'pipeline is successfully build'
        }
    }
}