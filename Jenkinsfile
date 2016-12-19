node {

	stage('Checkout code') {
		checkout scm
	}

	stage('Compile') {
		dir('simple_server') {
			sh 'rebar3 compile'
			sh 'rebar3 as prod tar'
			archiveArtifacts artifacts: '_build/prod/rel/simple_server/*.tar.gz', excludes: null
		}
	} 

}
