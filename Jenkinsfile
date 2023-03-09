pipeline {

  agent {
    node { label 'workstation' }
  }

  parameters {
    string(name: 'APPLY_ENV', defaultValue: 'dev', description: 'On which env you want to run?')
  }

  options {
    ansiColor('xterm')
  }

  stages {

    stage('Terraform Init') {
      steps {
        sh 'terraform init -backend-config=env-${APPLY_ENV}/backend.tfvars'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -var-file=env-${APPLY_ENV}/main.tfvars'
        sh 'env'
      }
    }

    stage('Terraform Apply') {
      when {
        beforeInput true
        expression {
          GIT_BRANCH == "main"
        }
      }
      input {
        message "Approve for Apply?"
        ok "Approve"
        submitter "admin"
      }
      steps {
        sh 'terraform apply -auto-approve -var-file=env-${APPLY_ENV}/main.tfvars'
      }
    }

  }

}
