pipeline {
  agent any
  stages {
    stage('ipam') {
      steps {
        httpRequest(url: 'https://10.128.1.252/api/requestIP', authentication: 'Basic Yw64BBGHTH=', contentType: 'application/json', consoleLogResponseBody: true, requestBody: '{"name" = "www.f5demo.com", "scope" = "tenant1"}')
      }
    }
  }
}