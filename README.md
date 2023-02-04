# auto-wallpaper
Scripts and documentation to support automatically fetching &amp; setting desktop wallpapers

## Instructions

1. Download a script from `scripts/` like `scripts/Unsplash-SetBackground.ps1`.
2. Open the script in a text editor and substitute `<client_id>` and `<collections>`.
  1. For `<client_id>`, you'll need to register an Unsplash developers/api application.
  2. For `<collections>`, you'll need a favorite collection id or collection ids seperated by a comma.
3. Add the script to your startup directory. `Win + R` > `shell:startup` > Copy / Cut / Paste / Move from downloads to startup.
4. OPTIONAL create a shortcut on your desktop to run the script. Right click the script > Copy as path > Right click desktop > New > Shortcut > Paste the path to the script.
5. OPTIONAL change the open with default to Powershell. Right click the script > Open with > pwsh / powershell / Choose another app
