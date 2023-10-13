# No widgets enabled!
pkill -x conky

sleep 5

conky -q -c /$HOME/.conky/victorConky/ArchLarge &
conky -q -c /$HOME/.conky/Gotham/Gotham & 

exit 0
