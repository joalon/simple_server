node {

	stage('Checkout code') {
		checkout scm
	}

	stage('Compile') {
		sh 'rebar3 tar'
	}

	stage('Run unit tests') {
		sh 'rebar3 eunit'
	} 

	stage('Archive tar') {
		archiveArtifacts artifacts: '_build/default/rel/simple_server/*.tar.gz', excludes: null
	}

}
