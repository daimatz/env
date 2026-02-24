execute 'install nodejs' do
  command 'curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s install stable'
  not_if 'which n'
end
