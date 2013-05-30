# ssh-agent logout
if [ `readlink $SSH_AUTH_SOCK` = $_SSH_AUTH_SOCK ]; then
  for agent in `find /tmp/ssh-*/agent.* -type s -user $USER`; do
    if [ $agent != $_SSH_AUTH_SOCK ]; then
      ln -snf $agent $HOME/tmp/ssh-agent-$USER
    fi
  done
fi

