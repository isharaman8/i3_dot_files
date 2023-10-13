# No widgets enabled!
pkill -x conky

sleep 5

conky -q -c /home/amank/.conky/victorConky/ArchLarge &
conky -q -c /home/amank/.conky/Gotham/Gotham & 

exit 0
