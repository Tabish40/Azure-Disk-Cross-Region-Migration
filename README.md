# Azure-Disk-Cross-Region-Migration
This repository addresses the limitations of Azure's cross-region disk migration. It provides a step-by-step solution to move a disk to a storage account and create a new disk from the resulting VHD file, enabling smooth migration workflows across regions.

Steps
**Process for Azure Disk Cross-Region Migration**

To overcome Azure disk cross-region migration limitations, follow these steps:

1. **Take a Snapshot of the Disk**  
   Identify the disk you want to migrate and create a snapshot of it.


   ![image](https://github.com/user-attachments/assets/4d87190d-f976-451d-8ba0-3f442de875a1)


3. **Copy the Snapshot to a Storage Account**  
   Transfer the snapshot to the desired storage account.

4. **Ensure Proper Format**  
   Make sure the snapshot is copied in the **VHD** format and set as a **Page Blob**.

5. **Use PowerShell Scripts**  
   Leverage PowerShell scripts to perform the above operations effectively. Refer to the provided scripts for guidance.

6. **Verify RBAC Permissions**  
   Ensure you have the required **Role-Based Access Control (RBAC)** permissions at both ends:  
   - For the disk and snapshot.  
   - For the storage account.

7. **Create a New Disk**  
   Once the VHD file is in the storage account, proceed to create a new disk from it.
