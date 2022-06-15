#!/bin/bash
for dir in /mnt/efs/worlds/*; do
	mkdir /home/ec2-user/maps/`basename $dir`
	docker run -v $dir/world/:/world -v /home/ec2-user/maps/`basename $dir`:/output unmined
	aws s3 sync /home/ec2-user/maps/`basename $dir` s3://minecraft-`basename $dir` 
done
