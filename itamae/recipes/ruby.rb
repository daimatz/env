
include_recipe 'base.rb'

['bundler', 'pry', 'rspec'].each do |gem|
  execute "install #{gem}" do
    command "gem install #{gem}"
    not_if "gem list | grep #{gem}"
  end
end
