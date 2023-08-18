execute 'add apt repository' do
  user 'root'
  command 'add-apt-repository -y ppa:openjdk-r/ppa && apt update'
  not_if 'apt search openjdk-17-jdk | grep openjdk'
end

[
  'openjdk-17-jdk',
  'maven',
].each do |pkg|
  package pkg
end
