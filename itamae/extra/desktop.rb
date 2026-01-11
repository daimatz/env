[
  'xorg',
  'xfce4',
  'xfce4-terminal',
  'fonts-vlgothic',
  'xserver-xorg-legacy',
  'dbus-x11',
  'tigervnc-standalone-server',
].each do |pkg|
  package pkg
end

execute "set needs_root_rights" do
  user 'root'
  command 'echo "needs_root_rights=yes\nallowed_users=anybody" > /etc/X11/Xwrapper.config'
end

execute ".vnc/xstartup" do
  user node[:name]

  command <<-CMD
cat > ~/.vnc/xstartup <<'EOF'
#!/bin/sh
export DISPLAY=:1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
xrdb "$HOME/.Xresources" 2>/dev/null || true
exec dbus-launch --exit-with-session startxfce4
EOF
chmod +x ~/.vnc/xstartup
  CMD
end
