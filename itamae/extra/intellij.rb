execute "download & unarchive" do
  url = 'https://download.jetbrains.com/idea/ideaIC-2016.3.4-no-jdk.tar.gz'
  command "curl -L #{url} | tar -xz -C #{node[:home]} && mv #{node[:home]}/idea-IC-* #{node[:home]}/intellij"
  not_if "test -d #{node[:home]}/intellij"
end
