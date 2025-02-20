# docker_annihilator
Docker Annihilator

Docker Annihilator is a powerful cleanup tool designed to provide a thorough reset of your Docker environment. With this script, you can efficiently remove all Docker-related components, ensuring a clean slate for your next project or deployment.

Features
Effortless Cleanup: Remove all unused Docker images with a single command.

Complete System Overhaul: Clean the entire Docker system, including containers, networks, and volumes.

Total Image Removal: Eliminate all Docker images, regardless of their status or dependencies.

Temporary Directory Purge: Clear out any residual files in the Docker temporary directory.

Seamless Restart: Restart the Docker daemon to apply changes and refresh your environment.

Usage
To unleash the full potential of the Docker Annihilator, follow these steps:

Clone the repository:

git clone https://github.com/mrexperimentalrandom/docker-annihilator.git

Navigate to the repository directory:

cd docker-annihilator

Make the script executable:

chmod +x docker_nuke.sh

Execute the script with elevated privileges:

sudo ./docker_nuke.sh

Important Notice
This script is designed to perform a comprehensive removal of all Docker components. It will delete all images, containers, and volumes from your system. Please ensure that you have backups of any important data before proceeding, as this action is irreversible.
The script will ask for permission for every action in sequence.

License
This project is dedicated to the public domain. Feel free to use, modify, and distribute it as you wish, with no attribution required.
