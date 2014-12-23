#
# Cookbook Name:: jenkins_drupal
# Recipe:: default
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
include_recipe 'apt::default'

ssh_known_hosts_entry 'bitbucket.org'

include_recipe "jenkins_drupal::jenkins"

include_recipe "jenkins_drupal::ssh_keygen"

include_recipe "jenkins_drupal::coding_standards"

include_recipe "jenkins_drupal::selenium"

include_recipe "jenkins_drupal::drush"
