# Steps to Migrate Disk from one region to another

# SOURCE - Update with your source details
$SnapshotResourceGroup = "<SourceSnapshotResourceGroup>"
$SnapshotName = "<SnapshotName>"

# DESTINATION - Update with your destination details
$StorageAccount = "<DestinationStorageAccountName>"
$StorageAccountBlob = "<DestinationContainerName>"
$StorageAccountResourceGroup = "<DestinationStorageResourceGroup>"
$vhdname = "<VHDName>"

# Retrieve the Storage Account key
$StorageAccountKey = (Get-AzStorageAccountKey -Name $StorageAccount -ResourceGroupName $StorageAccountResourceGroup).value[0]

# Get the snapshot from the source
$snapshot = Get-AzSnapshot -ResourceGroupName $SnapshotResourceGroup -SnapshotName $SnapshotName

# Grant access to the snapshot (SAS token validity: 7200 seconds)
$snapshotaccess = Grant-AzSnapshotAccess -ResourceGroupName $SnapshotResourceGroup -SnapshotName $SnapshotName -DurationInSecond 7200 -Access Read -ErrorAction stop 

# Create a storage context using the destination storage account key
$DestStorageContext = New-AzStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageAccountKey -ErrorAction stop

Write-Output "START COPY"

# Start copying the snapshot as a VHD in the destination container
Start-AzStorageBlobCopy -AbsoluteUri $snapshotaccess.AccessSAS -DestContainer $StorageAccountBlob -DestContext $DestStorageContext -DestBlob "$($vhdname).vhd" -Force -ErrorAction stop

Write-Output "END COPY"
