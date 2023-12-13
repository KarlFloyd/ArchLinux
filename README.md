## Arch Linux System Setup Script

This Bash script automates the setup process for an Arch Linux system, saving time by handling essential configurations, installations, and service enablement.
Usage

    Run the Script:
        Make the script executable if needed: chmod +x script_name.sh
        Execute the script with elevated privileges: sudo ./script_name.sh

    Script Workflow:

        Mirrorlist Update:
            Refreshes the mirrorlist for package updates.

        System Update:
            Updates the system packages without confirmation prompts.

        Pacman Configuration Modifications:
            Modifies pacman.conf by uncommenting color options, setting download parallelism, and adding preferences for a better package management experience.

        YAY Installation:
            Installs YAY, an AUR helper, facilitating easy AUR package installations.

        Essential and Additional Program Installation:
            Installs essential system tools and a selection of commonly used programs.

        KDE Plasma Packages and Steam Installation:
            Installs KDE Plasma packages and Steam gaming platform.

        Oh-My-ZSH Setup:
            Installs Oh-My-ZSH and associated plugins for enhanced ZSH shell experience.

        AUR Package Installation:
            Installs additional AUR packages using YAY.

        Locale Configuration and Bluetooth/Network Setup:
            Configures locales and enables Bluetooth and firewall settings.

        Service Enabling:
            Enables various services like SSH, Paccache, KDE Connect, Reflector, and Teamviewer.

        Cleanup:
            Removes orphaned files, cleans caches, and performs system cleanup tasks.

        Reboot:
            Provides an option to reboot the system immediately or wait for an automatic reboot.

## Important Notes

    Proceed with Caution:
        Review the script content before execution. Some commands modify system configurations and settings.

    Customization:
        Modify the script to suit personal preferences or add/remove packages as required.

    Post-Setup Checks:
        After script execution, review configurations and ensure desired installations were successful.

## Caution

    Backup:
        It's advisable to back up important data before executing system-wide changes or installations.

    User Interaction:
        Certain steps might require user confirmation or interaction during script execution.
