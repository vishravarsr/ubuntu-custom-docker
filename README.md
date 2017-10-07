# Brief
The project helps in repacking the ubuntu server 14.04 iso with necessary docker files. The setup-docker.sh has steps to install docker ce and ansible.

# Steps
* Download and save the Ubuntu 14.04 Server ISO under iso/ directory
* Add the docker scripts and supporting files under docker/
* Edit install.sh with appropriate ISO Image name {just one place where we mount the iso}
* Edit custom.seed file to update the md5 password hash according to need
* Run the shell script: sh install.sh

# Output
You will get an iso file generated in the current project directory which can be installed either in a pc or as a virtual box

After the installation, you will find the setup-docker.sh under /root

# TODO
Improve script to support multiple Ubuntu versions and flavors
