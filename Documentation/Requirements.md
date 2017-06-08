# Deployment
---
* [Introduction](./README.md)
* [Architecture](./ArchitectureDiagram.md)
* Deployment
    * **[Requirements](./Requirements.md)** <--
    * [Basic deployment](./Deployment-basic.md)
    * [High Availability deployment](./Deployment-HA.md)
    * [Storage Spaces Direct (S2D) Scale-Out File Server (SOFS) Cluster](./S2DFileServer.md)
    * [User Access Web Certificate](./UserAccessWebCert.md)
    * [AzureAutomation](./AzureAutomation.md)
* [Admin Guide](./RemoteDesktopRemoteApp.md)
* [User Guide](./UserAccess.md)
---
## Requirements
### Create a Microsoft Azure Subscription
First, make sure you meet the following requirements:

* An active Azure subscription. It can be a Trial Account, MSDN or Retail Subscription.
* Available quota of cores
  * The basic deployment requires 6 VMs. When you select the size of these virtual machines, you must ensure that the total cores in the deployment do not exceed the subscription capacity (Remember: the default quota of cores is 20). [Learn how to check your subscription VM core usage here](https://blogs.msdn.microsoft.com/madan/2016/10/25/check-azure-resource-manager-arm-vm-core-storage-usage-using-powershell/).
  
### Ensure Subscription Limits Suitable for RDS
* Default limits of 20 cores and 20 VMs (Call Support to Extend Limits if Needed).
* Consider: 1 to 10- users per core for Session Host, 200 users per core for Web/Gateway
* Set aside 1 or 2 cores for SMs for other roles
* A-Series VM most cost-effective (D-Series if you need SSDs, but typically don’t)
---
* [Introduction](./README.md)
* [Architecture](./ArchitectureDiagram.md)
* Deployment
    * **[Requirements](./Requirements.md)** <--
    * [Basic deployment](./Deployment-basic.md)
    * [High Availability deployment](./Deployment-HA.md)
    * [Storage Spaces Direct (S2D) Scale-Out File Server (SOFS) Cluster](./S2DFileServer.md)
    * [AzureAutomation](./AzureAutomation.md)
* [Admin Guide](./RemoteDesktopRemoteApp.md)
* [User Guide](./UserAccess.md)
---
