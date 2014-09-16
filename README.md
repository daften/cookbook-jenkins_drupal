jenkins_drupal Cookbook
=======================

[Jenkins][] is a continuous integration tool for executing repeated jobs. This
cookbook install jenkins and a lot of plugins to support testing [Drupal][] sites.

Requirements
------------

## Platforms

- Debian/Ubuntu

## Cookbooks:

* jenkins (to install jenkins)
* phpcs (to install phpcs for coding standards)
* ssh_knownn_hosts (to add bitbucket as a git hosting platform)

Attributes
----------

* `node['phpcs']['drupalcs_git_ref']` = revision for the coder module.

Usage
-----
Simply include the default recipe to get jenkins installed as a package with all plugins and dependencies for Drupal testing.

### Usage in roles:
```ruby
name "jenkins_drupal"
description "jenkins_drupal role"
run_list "recipe[jenkins_drupal::default]"
```

Contributing
------------
Contributions will be possible later by using the GitHub Pull Request system.

License and Authors
-------------------

* Author:: Dieter Blomme (dieterblomme@gmail.com

Copyright:: 2013-2014, Picabit

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
)


[Jenkins]:http://jenkins-ci.org//
[Drupal]:http://www.drupal.org/
