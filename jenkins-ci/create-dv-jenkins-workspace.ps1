# Create and populate the data container
#
& docker run --name dv_jenkins_workspace `
  -v /opt/jenkins/data/workspace gliderlabs/alpine:latest `
  /bin/true
