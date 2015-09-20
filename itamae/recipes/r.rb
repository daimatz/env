
include_recipe 'base.rb'

execute 'add repository' do
  repo = 'http://cran.rstudio.com/bin/linux/ubuntu trusty/'

  command <<-CMD
echo '#{repo}' >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
add-apt-repository ppa:marutter/rdev
apt update
  CMD
  not_if "grep '#{repo}' /etc/apt/soutces.list"
  user 'root'
end

{
  R: "http://cran.ism.ac.jp/bin/linux/ubuntu/trusty/r-recommended_3.2.2-1trusty0_all.deb",
  rstudio: "https://download1.rstudio.org/rstudio-0.99.484-amd64.deb",
}.each do |cmd, url|
  base = File.basename(url)
  execute "install #{url}" do
    user 'root'
    command "wget -P /tmp #{url} && dpkg -i /tmp/#{base}"
    not_if "which #{cmd}"
  end
end

include_recipe 'chown.rb'
