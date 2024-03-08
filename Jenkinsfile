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
                    echo "enviroment: ${params.environment}"
                """
            }
        }
        stage('Init'){
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('Plan'){
            steps {
                sh """
                    cd terraform
                    terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
        }
        stage('Apply'){
            steps {
                sh """
                    cd terraform
                    terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
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