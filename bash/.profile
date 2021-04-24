# Load RVM into a shell session *as a function*
if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
