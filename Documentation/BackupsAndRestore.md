# Backup and Recovery Strategy

When our RDS environment is deployed is recommendable to define a strategy for backup and recovery to be ready for a possible data loss.

In this type of environments, with a complex architecture, is necessary to consider all the elements that compose it and the key features and critical points of each of them.

In this short guide, we will take a quick look of the generic backup and recovery strategy for Azure VMs, and then, we will see in detail the considerations that we must consider for some of the elements of the architecture.

## Generic strategy for Backup and Recovery of Virtual Machines

The RDS environment we are implementing in this repo is mainly composed of Virtual Machines (VM) with assigned RDS roles. So, to define a strategy for backup and restore generic VMs is essential.

### Backups

In Azure Resources Manager, we can use Recovery Services vault to backup all our Virtual Machines. To activate the creation of backups we must enter on the Azure Portal and select the target VM.

On backup tab, we create a Recovery Services vault as can you see in the image bellow.

![](./images/backups-1.png)

Is necessary to define a backup policy, selecting a schedule and frequency, and the retention of the data. There is a default retention period, but we can enlarge this period if we want. It has an impact on the costs.

When we create and activate the backups, we can see all the information of this service on the Recovery Services Vault section in Azure Portal as you can see in the image bellow.

![](./images/backups-2.png)

The most important parts of this section are:

- Jobs: Here we can check the history that will be generated when the backups task are executed.
- Alerts and Events: Here are the notifications of the service. Is a nice place to be informed of the services status and backups task issues.
- Backups Items: Here we can check the VMs includes in this vault and access individually to each of them.

### Recovery

In the previous section, we saw how to configure the backups policies for our virtual machines. Now, we are going to see how to use these backups to restore one of them.
In the same tab of backups of the target VM we can see that after the firsts completed backups tasks, the button “Restore VM” is now active. To restore the VM, click on it.

![](./images/backups-5.png)

After click the button, we can see the available restore points. Select one of them and continue.

![](./images/backups-6.png)

Now, we can do two things: restore just the disk of the machine or create a new virtual machine form the backup.

**Restore disk** 

In this option, you only must select a storage account where the disks will be stored.

![](./images/backups-7.png)
 
**Create virtual machine**

We must select a new name for the VM, a Virtual Network, Subnet and Storage Account. Also, you can select a different Resource Group of the original if you want to restore this VM isolated.

![](./images/backups-8.png)

## Revovery of Domain Controllers

The recovery of Active Directory Domain Controllers on Virtual Machines is a supported scenario in Azure Backup. Active Directory Restore Mode (necessary for some cases) is also available in Azure, so, all the Active Directory recovery scenarios are viable.

However, is necessary to be aware of some considerations depending of the type of structure of the Domain: one Domain on one Domain Controller, one Domain on some Domain Contollers, or some Domains in a forest.

In this case, the second case is our structure: one Domain on some DCs (2 by default) and both can be reached over the same network.

**Last DC in the forest**

If we are trying to recovery a DC which is the last in the forest, is recommendable to do a forest recovery.

**In other case**

If we are trying to recovery a DC which is not the last in the forest, we can restore it as any VM.

## SQL Database

### Backups

Azure SQL Database Service automatically creates a database backups and at no additional charge.

Depending of the tier of the database the retention period is from 7 days to 35 days. It is possible to enlarge this period configuring the long-term retention policy. In this case, there is an additional cost associated.

### Restore

Now, let see how to use one of the automatically created restore points to restore a SQL Database.

In Azure Portal, select your database and go to the Overview tab. In the top menu, you can see a &quot;Restore&quot; button. Click on it.

![](./images/backups-3.png)

Well, in this window you can select the restore point that you want use to recover your database status.

![](./images/backups-4.png)

And it is all. Wait few minutes and your database status will be restored.

## Restore VMs with special network configuration

In this scenario, we have some special network configuration for some VMs, e.g., RDFE-VM01 and RDFE-VM02 are behind a Load Balancer. 
In this case, if we need to restore a one of these VMs, we must use Powershell to create them from the disks restored. You can know how do that [here](https://docs.microsoft.com/es-es/azure/virtual-machines/windows/quick-create-powershell).
After restore a VM, we must do some steps:
* **Static IP**: Some VMs in our RDS environment have static IPs. When a VMs is restored, the static IP is reset to a dynamic one to avoid conflicts. We must change it manually after restore.
* **Availability sets**: For load balancing, some VMs are in an availability set. In this case, how we said before, is recommended do a disk restore and then then add the availability set when create the VM via Powershell.

# Links

* [Generic backup VMs](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms)
* [Generic restore VMs](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-restore-vms)
* [Domain Controllers in VMs](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-restore-vms#restoring-domain-controller-vms)
* [SQL Database](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-automated-backups)