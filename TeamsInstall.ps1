#GPN - 4.25.2022
#Creates shortcut on the public desktop for all users and specifies which browser to open the shortcut. Also sets custom icon file if desired. 
#Create an icon file with convertto-icon.ps1 or https://convertio.co/jpg-ico/
#If you do not want to specify a browser to open the shortcut, and you want it to open in the default browser, do not specify a target path to a browser. Make the target path the URL you want to use, and comment out or delete the $Shortcut.Arguments line. 

#Create directory to hold icon file and copy file there
New-Item -Path "C:\ProgramData\TMT\TeamsWebApp" -ItemType Directory

# URL of the PNG image you want to download
$imageURL = "https://raw.githubusercontent.com/medteamadmins/MasterScript/main/TeamsIcon.ico"

# Specify the local path where you want to save the downloaded PNG file
$localFilePath = "C:\ProgramData\TMT\TeamsWebApp\TeamsIcon.ico"

# Create a WebClient object to download the image
$webClient = New-Object System.Net.WebClient

# Download the image and save it to the local path
$webClient.DownloadFile($imageURL, $localFilePath)

# Dispose of the WebClient object
$webClient.Dispose()

#---------------------------------------------


#Shortcut creation and specify settings
$chromeExePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$targetURL = "https://teams.microsoft.com/"
$shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "Teams Web App.lnk")

$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $chromeExePath
$shortcut.IconLocation = "C:\ProgramData\TMT\TeamsWebApp\TeamsIcon.ico"
$shortcut.Arguments = $targetURL
$shortcut.Save()
New-Item -Path "C:\ProgramData\TMT\TeamsWebApp\Successful.txt"