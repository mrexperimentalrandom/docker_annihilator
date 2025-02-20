#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print success messages
success() {
    echo -e "${GREEN}$1${NC}"
}

# Function to print error messages
error() {
    echo -e "${RED}$1${NC}"
}

# Function to print warning messages
warning() {
    echo -e "${YELLOW}$1${NC}"
}

# Function to check if Docker is running
check_docker() {
    if ! docker info >/dev/null 2>&1; then
        error "Docker is not running. Please start Docker and try again."
        exit 1
    fi
}

# Function to ask for user confirmation
confirm() {
    read -p "$1 (y/n): " choice
    case "$choice" in 
        y|Y ) return 0;;
        n|N ) return 1;;
        * ) echo "Invalid input. Please enter 'y' or 'n'."; confirm "$1";;
    esac
}

# Main cleanup function
cleanup_docker() {
    check_docker

    warning "This script will remove all Docker images, containers, and volumes."
    warning "Make sure you have backups of any important data."
    if ! confirm "Do you want to proceed with the cleanup?"; then
        echo "Cleanup aborted."
        exit 0
    fi

    echo "Starting Docker cleanup process..."

    if confirm "Remove unused images?"; then
        echo "Removing unused images..."
        docker image prune -af
        success "Unused images removed."
    fi

    if confirm "Clean up the entire Docker system (including stopped containers, unused networks, and volumes)?"; then
        echo "Cleaning up Docker system..."
        docker system prune --all --volumes -f
        success "Docker system cleaned up."
    fi

    if confirm "Remove all Docker images?"; then
        echo "Removing all Docker images..."
        docker rmi $(docker images -a -q) -f
        success "All Docker images removed."
    fi

    if confirm "Clean up Docker temporary directory?"; then
        echo "Cleaning up temporary directory..."
        sudo rm -rf /var/lib/docker/tmp/*
        success "Temporary directory cleaned up."
    fi

    if confirm "Restart Docker daemon?"; then
        echo "Restarting Docker daemon..."
        sudo systemctl restart docker
        success "Docker daemon restarted."
    fi

    success "Docker cleanup completed successfully!"
}

# Run the cleanup function
cleanup_docker
