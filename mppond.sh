#!/bin/sh

# Check for sender number
if [ "$SMS_1_NUMBER" != "+32xxxxxxxxx" ] ; then
    exit
fi

from=$SMS_1_NUMBER
message=$SMS_1_TEXT
reply=""

# Handle commands
case "$SMS_1_TEXT" in
    "Ping")
        reply="Pong!"
        ;;
    "MPPond ON")
        reply="Fontein aan"
        ;;
    "MPPond OFF")
        reply="Fontein uit"
        ;;
esac

output=`echo "$reply" | gammu-smsd-inject TEXT "$from"`
logger -s "$output"
