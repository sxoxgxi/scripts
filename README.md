# Scripts Folder

This folder contains a collection of useful shell scripts that automate certain tasks on my system `fedora silverblue`. Below are the descriptions of the scripts included and how to use them.

---

## Scripts

### 1. **grabsong.sh**

> Note: This script is available as a GNOME shell extension. Please see the [Grab Song](https://github.com/sxoxgxi/grabsong) for more details.

- This script extracts the currently playing song's Spotify URL and automatically downloads it using `spotdl`.

#### How to Use:

- Ensure that you have `spotdl` installed on your system.
- The script grabs the Spotify URL of the currently playing song through the `dbus-send` command.
- It will then download the song into your `~/Music` folder (or another folder you specify in the script).

### 2. **set_random_wall.sh**

This script changes the wallpaper to a random image from a predefined set of images in a folder.

### How to Use:

- This script assumes you have a folder of images you'd like to use as wallpapers. You can specify the folder in the script.
- It randomly selects an image from the folder and sets it as the desktop wallpaper.

### 3. **warp_manager.sh**

This script manages the `warp-svc` service for Cloudflare WARP, allowing you to start, stop, and check the WARP status.

### How to Use:

- The script uses `systemctl` to manage the `warp-svc` service and `curl` to check if WARP is active or inactive by querying `https://www.cloudflare.com/cdn-cgi/trace/`.
- It supports synonyms for commands (`start`, `enable`, `on` for starting and `stop`, `disable`, `off` for stopping).

### 4. **alacritty_opacity.sh**

This script allows you to set the opacity or transparency of alacritty terminal window.

### How to Use:

- The script modifies the `~/.config/alacritty/alacritty.toml` to alter the opacity of the terminal window.
- It updates the opacity by `0.01` depending on `i` for increasing, `d` for decreasing, `full` for setting opacity to `1` and `reset` to revert back to `0.9`.

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

   alias scripalias="bash /path/to/scripts/scriptname.sh"
   ```
