name             'jenkins_drupal'
maintainer       'Picabit'
maintainer_email 'info@picabit.be'
license          'Apache 2.0'
description      'Installs/Configures jenkins with drupal specific plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'
recipe           "jenkins_drupal", "Installs jenkins with all extras for drupal testing"
recipe           "jenkins_drupal::jenkins", "Installs jenkins as a package with some basic plugins"
recipe           "jenkins_drupal::coding_standards", "Install jenkins plugins and packages for code style testing"
recipe           "jenkins_drupal::selenium", "Installs jenkins plugins and dependencies for selenium testing (on Saucelabs)"

%w{ jenkins phpcs ssh_known_hosts maven }.each do |cb|
  depends cb
end

%w{ debian ubuntu }.each do |os|
  supports os
end
