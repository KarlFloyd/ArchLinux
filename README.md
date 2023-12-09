## Arch Linux System Setup Script

This Bash script automates the initial setup process for an Arch Linux system. It handles:

### 1. Updates & Configurations
- Updates mirrorlists and the system.
- Configures Pacman preferences in `pacman.conf`.
- Enables Bluetooth, SSH, and sets up the Uncomplicated Firewall (UFW) for specific traffic.

### 2. Installation of Essential Programs
- Installs crucial utilities and tools.
- Adds KDE Plasma packages, essential for KDE users.
- Sets up AUR repositories.

### 3. Additional Software Installation
- Installs programs like Discord, GIMP, Steam, etc.
- Configures Oh-My-ZSH and necessary plugins.

### 4. Miscellaneous Tasks
- Generates locales, cleans up caches, and sets up various services (TeamViewer, LACT, Paccache).

### Usage
- Run `./setup.sh` in a terminal.
- Review and understand the script's actions before execution.

### Disclaimer
- Use with caution; understand the commands before running.
- Modify the script according to your preferences.
