# use `ssh -YC <host>` to forward X.
[
  'xvfb',
  'fonts-vlgothic',
].each do |pkg|
  package pkg
end

execute 'add ciphers' do
  txt = <<-TXT
Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com,blowfish-cbc,aes128-cbc,3des-cbc,cast128-cbc,arcfour,aes192-cbc,aes256-cbc
  TXT
  command <<-COMMAND
echo '#{txt.strip}' >> /etc/ssh/sshd_config
service sshd restart
  COMMAND
  not_if "grep -E '#{txt.strip}' /etc/ssh/sshd_config"
end
