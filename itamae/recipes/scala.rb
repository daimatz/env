
include_recipe 'base.rb'
include_recipe 'java.rb'

{
  scala: 'http://www.scala-lang.org/files/archive/scala-2.10.4.deb',
  sbt: 'http://dl.bintray.com/sbt/debian/sbt-0.13.6.deb',
}.each do |cmd, url|
  base = File.basename(url)
  execute "install #{base}" do
    user 'root'
    command "wget -P /tmp #{url} && dpkg -i /tmp/#{base}"
    not_if "which #{cmd}"
  end
end
