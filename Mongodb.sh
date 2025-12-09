#!/bin/bash

# Author: Amaan Tamboli
# Description: MongoDB Installation steps for Ubuntu (Linux)
# Package: MongoDB
# MongoDB Version: 8.2

# Step 1: Install necessary dependencies (gnupg and curl)
echo "Installing gnupg and curl..."
sudo apt-get update
sudo apt-get install -y gnupg curl

# Step 2: Import the MongoDB public GPG key
echo "Importing MongoDB public GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Step 3: Create the MongoDB repository list file
echo "Creating MongoDB repository list file..."
sudo touch /etc/apt/sources.list.d/mongodb-org-8.2.list

# Step 4: Add the MongoDB repository to the package manager
echo "Adding MongoDB repository..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.2.list

# Step 5: Reload local package database
echo "Updating package list..."
sudo apt-get update

# Step 6: Install the latest stable version of MongoDB
echo "Installing MongoDB..."
sudo apt-get install -y mongodb-org

# Step 7: Start the MongoDB service
echo "Starting MongoDB service..."
sudo systemctl start mongod

# Step 8: If MongoDB fails to start, reload the daemon
if ! sudo systemctl status mongod | grep -q "active (running)"; then
    echo "MongoDB failed to start. Attempting to reload the daemon..."
    sudo systemctl daemon-reload
    sudo systemctl start mongod
fi

# Step 9: Verify MongoDB service status
echo "Verifying MongoDB service status..."
sudo systemctl status mongod

# Step 10: Print success message if everything works fine
if sudo systemctl status mongod | grep -q "active (running)"; then
    echo "MongoDB has been installed and started successfully!"
else
    echo "There was an issue with starting MongoDB. Please check the logs."
fi
