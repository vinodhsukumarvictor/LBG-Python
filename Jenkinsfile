pipeline {
	agent any
	
	environment {
		PORT = "9000"
	}

	stages {
		stage('cleanup') {
			steps {
				sh 'cd LBG-Python/'
				sh 'sudo chmod +x cleanup.sh'
				sh './cleanup.sh'
			}
		}

		stage('build') {
			steps {
				sh '''
				docker build -t eu.gcr.io/lbg-mea-12/lbg-python:lbg-python-vvictor-v2 .
				docker run -d -p 80:${PORT} -e PORT=${PORT} --name lbg-python eu.gcr.io/lbg-mea-12/lbg-python:lbg-python-vvictor-v2
				'''
			}
		}
		stage('run unit tests') {
			steps {
				sh '''
				python3 -m venv venv
				sudo chmod +x venv/bin/activate
				./venv/bin/activate
				pip3 install -r requirements.txt
				python3 lbg.test.py
				'''
			}
		}
		stage('push image') {
			steps {
				sh 'docker push eu.gcr.io/lbg-mea-12/lbg-python:lbg-python-vvictor-v2'
			}
		}
	}
	
}
