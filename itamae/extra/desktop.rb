[
  'xorg',
  'xfce4',
  'fonts-vlgothic',
  'xserver-xorg-legacy',
].each do |pkg|
  package pkg
end

execute "set needs_root_rights" do
  user 'root'
  command 'echo "needs_root_rights=yes\nallowed_users=anybody" > /etc/X11/Xwrapper.config'
end
