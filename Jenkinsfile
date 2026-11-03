pipeline
{
	agent any
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git 'https://github.com/adityamodi32/DevOpsClassCodes.git'
			}
		}
		
		stage('Compile')
		{
			steps
			{
				sh 'mvn compile'
			}
		}

		stage('Test')
		{
			steps
			{
				sh 'mvn test'
			}
		}

		stage('Build')
		{
			steps
			{
				sh 'mvn package'
			}
		}
		
		stage('Build Docker Image')
		{
			steps
			{
	
			    sh 'cp target/addressbook.war .'
				sh 'docker build -t adityapmodi/addressbook:$BUILD_NUMBER .'
				
			}
		}

		stage('Push Docker Image')
		{ 
			steps
			{   
			    withDockerRegistry([ credentialsId: "dockerhub_creds", url: "" ])
			    {
			       sh 'docker push adityapmodi/addressbook:$BUILD_NUMBER'
			    }
			}
		}

		stage('Deploy as container')
		{
			steps
			{
				sh 'docker run -d --name addressbook-$BUILD_NUMBER -P adityapmodi/addressbook:$BUILD_NUMBER'
			}
		}   
	}
		
}

