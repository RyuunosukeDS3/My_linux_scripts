#!/bin/sh

files=$(ls -I "startup.sh" -I "*.md")

for i in $files
do
    cp $i /etc/init.d/
    chmod +x /etc/init.d/$i
    ln -s /etc/init.d/$i /etc/rc.d/
done

echo "Succefully added scripts to the startup"