# == Class: gocd::agent
#
# Copyright 2016 Joshua M. Keyes <joshua.michael.keyes@gmail.com>
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

class gocd::agent (
  $server,
  String $package_name    = 'go-agent',
  String $package_ensure  = 'installed',
  String $service_name    = 'go-agent',
  String $service_ensure  = 'running',
  Boolean $service_enable  = true,
  Boolean $manage_service  = true,
  Boolean $manage_package  = true,
  Integer $server_ssl_port = 8154,
  Integer $server_port     = 8153,
  String $jvm_min_memory  = '256m',
  String $jvm_max_memory  = '512m',
) {
  # Fail fast if we're not using a new Puppet version.
  if versioncmp($::puppetversion, '4.4.0') < 0 {
    fail('This module requires the use of Puppet v4.4.0 or newer.')
  }

  contain '::gocd::common'
  contain '::gocd::agent::install'
  contain '::gocd::agent::config'
  contain '::gocd::agent::service'

  Class['::gocd::common']
  -> Class['::gocd::agent::install']
  -> Class['::gocd::agent::config']
  ~> Class['::gocd::agent::service']
}
