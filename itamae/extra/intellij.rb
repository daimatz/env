execute "download & unarchive" do
  url = 'https://download.jetbrains.com/idea/ideaIC-2024.2.4.tar.gz'
  command "curl -L #{url} | tar -xz -C #{node[:home]} && mv #{node[:home]}/idea-IC-* #{node[:home]}/intellij"
  not_if "test -d #{node[:home]}/intellij"
end
