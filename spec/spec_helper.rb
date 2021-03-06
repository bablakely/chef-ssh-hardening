# encoding: utf-8

#
# Copyright 2014, Deutsche Telekom AG
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

require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
require 'coveralls'

# coverage report
Coveralls.wear!
at_exit { ChefSpec::Coverage.report! }

RSpec.configure do |config|
  # OS and version for mocking of ohai data, needed by chefspec
  config.platform = 'ubuntu'
  config.version = '16.04'
  config.file_cache_path = '/tmp/ssh-hardening-file-cache'
end

require_relative '../libraries/devsec_ssh'
require_relative 'shared_examples_crypto'
