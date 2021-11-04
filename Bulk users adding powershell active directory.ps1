#This was made in windows server 2016 powershell ise comments added in visual studio later
#grabs the csv file if needed change the path.
Import-Csv -Path 'C:\UserList.csv' | foreach {
    $NewUserParameters = @{
    'GivenName' = $_.FirstName
    'Surname' = $_.LastName
    'Name' = $_.UserName
    'AccountPassword' = (ConvertTo-SecureString $_.Password -AsPlainText -Force -ChangePasswordAtLogon $true)
    
    }
    New-AdUser @NewUserParameters
    }
    #this is to add a bulk group if the default group is fine feel free to remove this.
    Import-Csv -Path 'C:\UserList.csv' | foreach {  
    $groups = @{
    'Identity' = $_.GroupName  
    'Members' = $_.UserName
    }
    Add-ADGroupMember @groups
    }