pipeline {
    agent any
    stages {
        stage('test') {
            steps {
                dir("${env.WORKSPACE}"){
                  bat 'cookstyle'
                  bat 'kitchen test --destroy always'
                }
            }
        }
        stage('build') {
            steps {
                dir("${env.WORKSPACE}"){
                  bat 'del Policyfile.lock.json'
                  bat 'chef install'
                }
            }
        }
        stage('deploy_stage') {
            steps {
                dir("${env.WORKSPACE}"){
                  bat 'chef push staging Policyfile.rb'
                  bat 'knife ssh "policy_name:mycorp_webserver AND policy_group:staging" "sudo chef-client" -x Administrator -P "Fundamentals1"'
                }
            }
        }
        stage('deploy_prod') {
            steps {
                dir("${env.WORKSPACE}"){
                  bat 'chef push production Policyfile.rb'
                  bat 'knife ssh "policy_name:mycorp_webserver AND policy_group:production" "sudo chef-client" -x Administrator -P "Fundamentals1"'
                }
            }
        }
    }
}