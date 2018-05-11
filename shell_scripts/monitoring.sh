#!/usr/bin/env bash

URL=https://learn.vogella.com/login
SEARCH_STRING="Learning Portal"

if [ "$(curl -s $URL | grep "$SEARCH_STRING")" == "" ] ; then
    echo "$(date) ALARM: Learning Portal looks down - string \"$SEARCH_STRING\" couldn't be found in server answer." | mail -s '[learn.vogella.com] ALARM: Learning Portal looks down' lars.vogel@vogella.com,jonas.hungershausen@vogella.com,fabian.pfaff@vogella.com
fi
