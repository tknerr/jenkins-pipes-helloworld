
# Jenkins Pipes HelloWorld

A minimal and stupid "helloworld" example project for the [Jenkins Pipes](https://github.com/tknerr/jenkins-pipes-infra) demo:

 * the `Jenkinsfile` describes **HOW** to build this project in [Pipeline-DSL](https://jenkins.io/doc/book/pipeline/syntax/)


## How it works

This example will be built on our [jenkins-pipes-infra](https://github.com/tknerr/jenkins-pipes-infra/blob/master/Dockerfile) because in [jenkins-pipes-jobs](https://github.com/tknerr/jenkins-pipes-jobs/blob/master/ci_jobs.groovy) we configured to build all `master` and `feature/*` branches of this repo.

The `Jenkinsfile` in here describes **HOW** this project is built, in terms of the individual stages that make up the build pipeline and what happens within them:

```groovy
node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('prepare') {
      sh "git clean -fdx"
    }
    stage('compile') {
      echo "nothing to compile for hello.sh..."
    }
    stage('test') {
      sh "./test_hello.sh"
    }
    stage('package') {
      sh "tar -cvzf hello.tar.gz hello.sh"
    }
    stage('publish') {
      echo "uploading package..."
    }
  } finally {
    stage('cleanup') {
      echo "doing some cleanup..."
    }
  }
}
```

The `master` branch build should succeed:

![image](https://cloud.githubusercontent.com/assets/365744/22727812/3ad04a26-eddb-11e6-9dd9-5d2e5a975f22.png)

The `feature/make-it-fail` branch shows how a build failure looks like:

![image](https://cloud.githubusercontent.com/assets/365744/22727851/688829b6-eddb-11e6-8233-6503c5a6fa49.png)


## Where to go from here?

Now that you have a minimal example running, here are some ideas on how to dig further:

 * go and explore the [Pipeline-DSL](https://jenkins.io/doc/book/pipeline/syntax/) and [Steps Reference](https://jenkins.io/doc/pipeline/steps/)
 * add email notifications on success / failure
 * create a similar helloworld example in your favorite programming language
 * use node labels to run your builds on specific nodes only
 * try modeling more complex pipelines with parallel execution etc
 * ...
