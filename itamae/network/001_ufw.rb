execute 'firewall' do
  user 'root'
  command <<-CMD
ufw default deny
ufw allow ssh
ufw limit 60000:60030/udp
yes y | ufw enable
  CMD
end
