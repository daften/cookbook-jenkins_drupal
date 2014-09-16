#
# Cookbook Name:: jenkins_drupal
# Recipe:: coding_standards
#
# Author:: Dieter Blomme <dieterblomme@gmail.com>
#
# Copyright 2013-2014, Picabit.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install plugins for code style analysis
jenkins_plugins = ['token-macro', 'mailer', 'javadoc', 'maven-plugin',
  'ant', 'dashboard-view', 'analysis-core', 'checkstyle']

jenkins_plugins.each do |plugin|
  jenkins_plugin plugin
end

# phpcs. execute apt::default just in case for apt-get update

include_recipe "phpcs"

# Manual install of Drupal coding standard, since it's in a git subdirectory

git "#{Chef::Config[:file_cache_path]}/coder" do
  repository "http://git.drupal.org/project/coder.git"
  reference node['phpcs']['drupalcs_git_ref']
  action :sync
  notifies :run, "bash[copy-drupal-standard]"
end

bash "copy-drupal-standard" do
  user "root"
  code <<-EOH
    cp -Rf #{Chef::Config[:file_cache_path]}/coder/coder_sniffer/Drupal $(pear config-get php_dir)/PHP/CodeSniffer/Standards/
  EOH
  action :nothing
end
