execute 'chown' do
  user 'root'
  command "chown -R #{node[:name]}:#{node[:name]} #{node[:home]}"
end
