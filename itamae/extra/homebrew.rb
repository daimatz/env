execute 'install homebrew' do
  user node[:name]
  command 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  not_if 'which brew'
end
