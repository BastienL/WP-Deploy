WP-Deploy
=========

Just a simple shell script to make your WordPress deployments easy and safe. Because sometimes you don't want to use Ruby, Capistrano and everything to update your WordPress website. And you're bored with your FTP client.

This script, based on rsync, requires an SSH connection, and that's it.

To use it, just update the constants in the deploy.sh file and add your custom not-to-deploy files in the exclude.rsync file.

To run it, just type:

	./deploy.sh test (to deploy on your test server)
	./deploy.sh production (to deploy on your production server) 