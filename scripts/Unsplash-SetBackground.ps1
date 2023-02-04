"===== Unsplash-SetBackground START ====="
# Parameters
# TODO: Replace <client_id> with your Unsplash Client ID.
$ClientID = <client_id>"
# TODO: Replace <collections> with a comma seperated list of Unsplash Collection IDs.
$Collections = "<collections>"
# TODO: OPTIONAL Replace $Home\Pictures\Unsplash-SetBackground\ with your desired location.
$Folder = "$Home\Pictures\Unsplash-SetBackground\"

# Request information about a random photo from Unsplash.
$Photo = Invoke-RestMethod -URI https://api.unsplash.com/photos/random?collections=$Collections -Headers @{"Authorization" = "Client-ID $ClientID"}
# Print useful information about the photo received
"URL: " + $Photo.links.self
"Description: " + $Photo.description
"Alt Description: " + $Photo.alt_description
"Location: " + $Photo.location.name, $Photo.location.country, $Photo.location.city, $photo.location.position

# Make the folder if it does not already exist
md $Folder -ErrorAction SilentlyContinue
# Wipe the folder clean
Remove-Item $Folder* -Recurse -Force

# Download the image from Unsplash
$Image = $Folder + $Photo.id + ".jpg"
Invoke-WebRequest $Photo.urls.full -OutFile $Image

# Set the wallpaper to the image
Add-Type -TypeDefinition @"
using System.Runtime.InteropServices;
public class Wallpaper
{
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(20, 0, path, 0x01 | 0x02);
  }
}
"@
[Wallpaper]::SetWallpaper($Image)

# Open the URL
Start-Process $Photo.links.html
"===== Unsplash-SetBackground END ====="
