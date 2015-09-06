
include_recipe 'base.rb'

[
  'ruby-dev',
  'rake',
].each do |pkg|
  package pkg
end

['bundler', 'pry', 'rspec'].each do |gem|
  execute "install #{gem}" do
    command "gem install #{gem}"
    not_if "gem list | grep #{gem}"
  end
end

include_recipe 'chown.rb'
