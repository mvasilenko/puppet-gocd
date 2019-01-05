source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :test do
  gem 'rake', '~> 10.4.0',      :require => false
  gem 'rspec', '~> 3.0',        :require => false
  gem 'rspec-core',             :require => false
  gem 'rspec-puppet',           :require => false
  gem 'puppetlabs_spec_helper', :require => false
  gem 'json_pure', '<2.0.2'
  gem 'json', '<2.0.0'
end

group :development do
  gem 'travis',            :require => false
  gem 'travis-lint',       :require => false
  gem 'puppet-syntax',     :require => false
  gem 'puppet-blacksmith', :require => false
end

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '~> 4.4.0', :require => false
end
