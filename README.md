### Deploy Ubuntu Server To U Disk

+ **Related Reference for Ubuntu Server**<p>
  [*Offical Information*](http://www.ubuntu.com/server)

+ **Download Path for Ubuntu Server**<p>
  [*Download*](http://www.ubuntu.com/download/server/thank-you?country=SG&version=16.04&architecture=amd64)

+ **Precondition**<p>
  Software: *ubuntu-16.04-server-amd64.iso*<p>
  Hardware: *16G U Disk*<p>
  Script: *deploy.sh*<p>

+ **Procedure**<p>
 - Processed U Disk<p>
 *PS: Suppose its path is /dev/sda, and has only one partition.*<p>
 `fdisk /dev/sda`<p>
 `mkfs.ext4 /dev/sda1`<p>

 - Download Ubuntu Server Image<p>
 *PS: Suppose the download folder is 'tmp' folder.*<p>

 - Run Shell Script<p>
 *PS: Go into 'tmp' folder, copy 'deploy.sh' here and run it.*<p>


