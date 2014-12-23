#
# Cookbook Name:: jenkins_drupal
# Recipe:: drush
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

include_recipe 'git'
include_recipe 'composer'

git "#{node['drush']['install_dir']}/drush" do
  repository "https://github.com/drush-ops/drush.git"
  reference node['drush']['drush_version']
  action :sync
end

link "/usr/bin/drush" do
  to "#{node['drush']['install_dir']}/drush/drush"
end

bash "Install drush via composer" do
  code <<-EOH
    cd #{node['drush']['install_dir']}/drush; sudo composer install;
  EOH
end

tar_extract "#{node['drush']['console_table_url']}" do
  target_dir "#{node['drush']['install_dir']}/drush/lib"
  creates "#{node['drush']['install_dir']}/drush/lib/Console_Table-1.1.3"
end
