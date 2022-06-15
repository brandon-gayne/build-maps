#!/bin/bash
for dir in /worlds/*; do
	root=`basename $dir`
	echo $dir
	echo `basename $dir`
	mkdir /$root
	/unmined/unmined-cli web render --world=/worlds/$root/world --output=/$root
	mv /$root/unmined.index.html /$root/index.html
	aws s3 sync /$root s3://minecraft-$root
done
