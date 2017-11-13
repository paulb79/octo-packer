import jenkins.model.Jenkins

Jenkins jenkins = Jenkins.getInstance()

jenkins.model.Jenkins.instance.securityRealm.createAccount('buildmonitor', 'bdec')


def adminUser = hudson.model.User.get('admin')
def monitorUser = hudson.model.User.get('buildmonitor')


def strategy = new hudson.security.GlobalMatrixAuthorizationStrategy()
strategy.add(hudson.model.Hudson.ADMINISTER, adminUser.getId())
strategy.add(hudson.model.Item.READ, monitorUser.getId())
strategy.add(hudson.model.Hudson.READ, monitorUser.getId())

jenkins.model.Jenkins.instance.setAuthorizationStrategy(strategy)