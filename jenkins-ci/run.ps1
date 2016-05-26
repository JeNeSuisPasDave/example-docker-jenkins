# Launch the Jenkins CI container
#
& docker run -d -p 8080:8080 --name jenkins `
  --volumes-from dv_jenkins_workspace `
  -v /var/run/docker.sock:/var/run/docker.sock `
  datihein/jenkins-dockercli
