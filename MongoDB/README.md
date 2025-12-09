Sure! Here's a `README.md` file for your MongoDB installation script:

````markdown
# MongoDB Installation Script for Ubuntu

## Author
- **Amaan Tamboli**

## Description
This is a shell script to automate the installation of MongoDB on Ubuntu (Linux). It installs MongoDB version 8.2 using the official MongoDB repository, adds the necessary GPG keys, and starts the MongoDB service. The script also includes error handling to reload the daemon if MongoDB fails to start.

## Prerequisites
- Ubuntu (any version from 18.04 onwards should work)
- A user with `sudo` privileges
- Internet access to download MongoDB and required dependencies

## Installation Steps

### 1. Clone or Download the Script

First, clone or download this repository to your local machine.

```bash
git clone https://your-repo-url-here.git
cd your-repository-directory
````

### 2. Make the Script Executable

Ensure that the script file is executable by running the following command:

```bash
chmod +x install_mongodb.sh
```

### 3. Run the Script

To run the script, execute it using `sudo` to ensure it has the required permissions:

```bash
sudo ./install_mongodb.sh
```

The script will:

* Install necessary dependencies (`gnupg`, `curl`)
* Import MongoDB's official GPG key
* Add MongoDB repository to the package manager
* Install the latest stable version of MongoDB
* Start the MongoDB service
* If MongoDB fails to start, it will attempt to reload the systemd daemon and restart MongoDB

### 4. Verify MongoDB Installation

Once the script has finished, you can verify that MongoDB is running by checking its status:

```bash
sudo systemctl status mongod
```

If MongoDB is installed and running successfully, you will see output indicating that the service is active and running.

---

## Uninstallation (Optional)

If you need to uninstall MongoDB for any reason, follow these steps:

1. **Stop MongoDB Service**:

   ```bash
   sudo systemctl stop mongod
   ```

2. **Remove MongoDB packages**:

   ```bash
   sudo apt-get purge mongodb-org*
   ```

3. **Remove MongoDB data and logs**:
   If you want to completely remove MongoDB's data and log files, run:

   ```bash
   sudo rm -r /var/log/mongodb
   sudo rm -r /var/lib/mongodb
   ```

4. **Remove the MongoDB repository**:
   To remove the MongoDB repository file, use:

   ```bash
   sudo rm /etc/apt/sources.list.d/mongodb-org-8.2.list
   ```

---

## Troubleshooting

* **MongoDB fails to start**:

  * The script automatically attempts to reload the systemd daemon if MongoDB fails to start. If you still encounter issues, you can check the logs using:

  ```bash
  journalctl -u mongod
  ```

* **MongoDB version not available**:

  * Make sure the MongoDB repository URL is correct and accessible.
  * Ensure that your Ubuntu version is compatible with MongoDB 8.2 (check MongoDB's official documentation for compatibility).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

### Key Sections of the README:
1. **Description**: Gives a brief overview of what the script does.
2. **Prerequisites**: Lists what is required to run the script (Ubuntu, sudo privileges, etc.).
3. **Installation Steps**: Detailed steps to download, make the script executable, and run it.
4. **Verification**: How to verify if MongoDB is installed and running.
5. **Uninstallation**: Provides instructions to remove MongoDB and clean up.
6. **Troubleshooting**: Helps users troubleshoot potential issues with MongoDB installation or startup.
7. **License**: It’s always good practice to add a license section if you plan to share or distribute your script publicly.

---

Let me know if you'd like any modifications!
```
