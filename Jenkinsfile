pipeline {
    agent any

    stages {
       stage('Deploy'){

         echo 'Push to Repo'
         sh './auto.sh'
         echo '##COMPLETED##'


       }
    }
def boolean hasChangesIn(String module) {
    if (env.CHANGE_TARGET == null) {
        return true;
    }

    def MASTER = sh(
        returnStdout: true,
        script: "git rev-parse origin/${env.CHANGE_TARGET}"
    ).trim()
    def HEAD = sh(
        returnStdout: true,
        script: "git show -s --no-abbrev-commit --pretty=format:%P%n%H%n HEAD | tr ' ' '\n' | grep -v ${MASTER} | head -n 1"
    ).trim()

    // debug
    sh "git diff --name-only ${MASTER}...${HEAD}"

    return sh(
        returnStatus: true,
        script: "git diff --name-only ${MASTER}...${HEAD} | grep \"${module}\""
    ) == 0
 }
}