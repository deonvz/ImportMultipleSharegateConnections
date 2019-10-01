#Created by: Deon van Zyl
#2019/10/01
#Goal: setup all connections in ShareGate via a site CSV or Xlsx list import (This must have a Url column).
#Supply Your username and password below so that ShareGate can add it to each new connection.
#=== Step 1====
Set-ExecutionPolicy RemoteSigned
Import-Module Sharegate
$csvFile = "C:\sites.csv"
$table = Import-Csv $csvFile
$myUsername = "yourusername"
$myPassword = ConvertTo-SecureString "yourpassword" -AsPlainText -Force
foreach ($row in $table) {
     Connect-Site -Url $row.URL -Username $myUsername -Password $myPassword -AddToExplorer
}
#=== Connect to other Auth type sites via this guide https://support-desktop.sharegate.com/hc/en-us/articles/115000640548-Connect-Site
#=== Step 2=====
# If you open ShareGate desktop, all these connections have now been added, 
# you can now decise to run planning or other functions against them or if they are Subsites, their parent main site. 