I - Setup Webhook pointing to the jenkins job

II - Create a Jenkins job to build base image:
* Give the following are the build steps for the Job
echo "triggering image build for VIJAY CICD ..."
sh ./buildimage.sh $BaseImage $BuildImage $registrypassword
echo "Completed image build for VIJAY CICD ..."

* Set Job Parameters i.e string parameter for BaseImage, BuildImage & password parameter for registrypassword & set the following as default values
  BaseImage="jboss/base-jdk:11"
  BuildImage="wildfly"
* Build when a change is pushed to GitLab under "Build Triggers"..
