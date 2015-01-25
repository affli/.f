if [[ $- != *i* ]] ; then
       # Shell is non-interactive.  Be done now!
       return
fi



for plugin in ~/.bashrc.d/*.bash; do
    if [ -r $plugin ] ; then
        . $plugin
    fi
done
unset plugin
