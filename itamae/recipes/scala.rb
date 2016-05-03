
include_recipe 'base.rb'
include_recipe 'java.rb'

[
  'libjansi-java',
  'libjansi-native-java',
  'libhawtjni-runtime-java',
].each do |pkg|
  package pkg
end

{
  scala: 'http://www.scala-lang.org/files/archive/scala-2.11.8.deb',
  sbt: 'http://dl.bintray.com/sbt/debian/sbt-0.13.11.deb',
}.each do |cmd, url|
  base = File.basename(url)
  execute "install #{base}" do
    user 'root'
    command "wget -P /tmp #{url} && dpkg -i /tmp/#{base}"
    not_if "which #{cmd}"
  end
end

include_recipe 'chown.rb'
