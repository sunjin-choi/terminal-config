
echo "# remove all bindkeys" > ~/.tmux.reset.conf
echo "" >> ~/.tmux.reset.conf

echo "unbind -a" >> ~/.tmux.reset.conf
echo "" >> ~/.tmux.reset.conf


echo "#set to default bindkeys" >> ~/.tmux.reset.conf
echo "" >> ~/.tmux.reset.conf


tmux -f /dev/null -L temp start-server \; list-keys >> ~/.tmux.reset.conf
