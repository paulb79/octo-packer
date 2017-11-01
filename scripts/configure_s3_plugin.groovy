import jenkins.model.Jenkins

Jenkins jenkins = Jenkins.getInstance()

def s3Descriptor = jenkins.getDescriptorByType(
        hudson.plugins.s3.S3BucketPublisher.DescriptorImpl.class
)

s3Descriptor.profiles

def defaultProfile = new hudson.plugins.s3.S3Profile("default", null, null, true, 5, "5", "5", "5", "5", false)

hudson.plugins.s3.S3BucketPublisher.DESCRIPTOR.replaceProfiles([defaultProfile])

jenkins.save()