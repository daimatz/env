
include_recipe 'base.rb'
include_recipe 'java.rb'

{
  scala: 'http://www.scala-lang.org/files/archive/scala-2.10.4.deb',
  sbt: 'http://dl.bintray.com/sbt/debian/sbt-0.13.6.deb',
}.each do |cmd, url|
  execute 'install deb' do
    user 'root'
    command "wget -P /tmp #{url} && xargs dpkg -i /tmp/#{File.basename(url)}"
    not_if "which #{cmd}"
  end
end
