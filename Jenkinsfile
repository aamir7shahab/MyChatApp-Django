pipeline {
    agent any
    stages {

        stage("Build & SonarQube analysis") {
            steps {
                withSonarQubeEnv('sonar_scanner') {
                 sh "/opt/sonar_scanner/bin/sonar-scanner"
                }
            }
        }

        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                  waitForQualityGate abortPipeline: true
                    }
                }
            }
        }


        // stage("Deploy") {
        //     steps{
        //        step([$class: 'AWSCodeDeployPublisher',
        //             applicationName: 'jenkinsDemo',
        //             awsAccessKey: '',
        //             awsSecretKey: '',
        //             credentials: 'AWS credentials',
        //             deploymentConfig: 'CodeDeployDefault.OneAtATime',
        //             deploymentGroupAppspec: false,
        //             deploymentGroupName: 'Jenkin-DevGrp',
        //             deploymentMethod: 'deploy',
        //             excludes: '',
        //             iamRoleArn: '',
        //             includes: '**',
        //             proxyHost: '',
        //             proxyPort: 0,
        //             region: 'ap-south-1',
        //             s3bucket: 'jenkinsbucketdemo',
        //             s3prefix: '',
        //             subdirectory: '',
        //             versionFileName: '',
        //             waitForCompletion: true])
        //         }
        // }

    }
}
