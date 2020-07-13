#!/bin/bash

gllog=/glftpd/ftp-data/logs/glftpd.log
newversion=`lynx --dump https://glftpd.io | grep "latest version" | cut -d ":" -f2 | sed -e 's/20[2-9][0-9].*//' -e 's/^  //' -e 's/^v//'`
curversion=`/glftpd/bin/glftpd-full-static | grep glFTPd | sed -e 's/(.*//' -e 's/glFTPd//' -e 's/^ //'`

if [ "$newversion" != "$curversion" ]
then
    echo "New version available: $newversion"
    echo `date "+%a %b %e %T %Y"` GLVERSION: \"There is a new glFTPd version available: $newversion - Current version: $curversion - https://glftpd.io\" >> $gllog
else
    echo "Current version up to date"
fi

exit 0
