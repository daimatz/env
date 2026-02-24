execute 'install nodebrew' do
  command 'curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s install stable'
  not_if 'which n'
end
