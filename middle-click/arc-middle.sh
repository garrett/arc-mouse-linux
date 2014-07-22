#!/bin/sh

echo '"Microsoft Microsoft® Nano Transceiver v1.0" "/dev/input/event.*" any key/151 "XButton/2"' > /tmp/evrouter.conf


sudo chgrp wheel /dev/input/event* && sudo chmod 660 /dev/input/event*

killall evrouter; evrouter /dev/input/event* -c /tmp/evrouter.conf

rm /tmp/evrouter.conf
