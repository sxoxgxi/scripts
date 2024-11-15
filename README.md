# Scripts Folder

This folder contains a collection of useful shell scripts that automate certain tasks on my system `fedora silverblue`. Below are the descriptions of the scripts included and how to use them.

---

## Scripts

### 1. **spotgrab.sh**

This script extracts the currently playing song's Spotify URL and automatically downloads it using `spotdl`.

#### How to Use:

- Ensure that you have `spotdl` installed on your system.
- The script grabs the Spotify URL of the currently playing song through the `dbus-send` command.
- It will then download the song into your `~/Music` folder (or another folder you specify in the script).

### 2. **set_random_wall.sh**

This script changes the wallpaper to a random image from a predefined set of images in a folder.

### How to Use:

- This script assumes you have a folder of images you'd like to use as wallpapers. You can specify the folder in the script.
- It randomly selects an image from the folder and sets it as the desktop wallpaper.

---

## Usage for Scripts:

1. Make the script executable:
   ```bash
   chmod +x scriptname.sh
   ```
2. Run the script:
   ```bash
   ./scriptname.sh
   ```
3. Set an alias (Optional):

   ```bash
   nano ~/.bashrc  # For Bash
   # Or
   nano ~/.zshrc   # For Zsh

   # Then add following to the file

   alias spotgrab="bash /path/to/scripts/spotgrab.sh"
   alias wallpaper="bash /path/to/scripts/set_random_wall.sh"
   ```
