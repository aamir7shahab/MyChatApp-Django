pipeline {
    agent any
    stages {

        stage("Build & SonarQube analysis") {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                sh "/opt/sonar_scanner/bin/sonar-scanner \
                -Dsonar.projectKey=PipelineTest \
                -Dsonar.sources=/var/lib/jenkins/workspace/$JOB_NAME"
                }
            }
        }

        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    script {          
                        def qualitygate = waitForQualityGate()
                        if (qualitygate.status != "OK") {
                            error "Pipeline aborted due to quality gate coverage failure: ${qualitygate.status}"
                        }
                    }
                }
            }
        }
    
        stage("Deploy") {
            steps{
               step([$class: 'AWSCodeDeployPublisher',
                    applicationName: 'jenkinsDemo',
                    awsAccessKey: '',
                    awsSecretKey: '',
                    credentials: 'AWS credentials',
                    deploymentConfig: 'CodeDeployDefault.OneAtATime',
                    deploymentGroupAppspec: false,
                    deploymentGroupName: 'Jenkin-DevGrp',
                    deploymentMethod: 'deploy',
                    excludes: '',
                    iamRoleArn: '',
                    includes: '**',
                    proxyHost: '',
                    proxyPort: 0,
                    region: 'ap-south-1',
                    s3bucket: 'jenkinsbucketdemo',
                    s3prefix: '',
                    subdirectory: '',
                    versionFileName: '',
                    waitForCompletion: true])
                }
        }
    }
}
