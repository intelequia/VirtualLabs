# **Template execution steps**

## Basic deployment
The Azure Resource Manager template ‘rds-base-azuredeploy.json’ creates a Virtual Network, three subnets (Frontend, Backend and SessionHost ones), three Network Security Groups (one for each subnet to allow internal and external RDS communications) and a Standard Storage account in which vhds will be stored.
It is linked to other templates, this enable us decomposing our deployment into a set of targeted, purpose-specific templates:
* **rds-ad-azuredeploy.json**  
This template helps us to create and configurate two Windows Server 2016 virtual machine which gets the Domain Controller role.
* **rds-be-azuredeploy.json**  
This template helps us to create a Windows Server 2016 virtual machine, join it to the domain and configure Web and Gateway roles.
* **rds-fe-azuredeploy.json**  
This template helps us to create a Windows Server 2016 virtual machine, join it to the domain and configure Licensing and Connection Broker roles.
* **rds-sh-azuredeploy.json**  
This template helps us to create a Windows Server 2016 virtual machine, join it to the domain and configure Session Host role.

After running this sub deployments, this template is ready to ensemble RDS scenario through Remote Desktop Management Server. Here it activates Licensing, specifies DNS name as the RD Gateway server name for deployment properties, as well as create and install self-signed certificates for the RD Gateway and Connection Broker

## Export and copy self-signed certificates to client computers 
Refer to the [self-signed certificates](./UserAccessWebCert.md) guide. 

## Configure Session Collection
* Set Domain Users as user group

--------------------------------------------------------------------------------------------
### RDS roles overview
* **Active Directory Domain Services (AD DS)**  
Stores one domain directory partition, the information about the domain in which it is located.
* **Web Access (RDWeb)**  
Provides user logon and selection of desktops and applications
* **Gateway (RDGW)**  
Routes RDP traffic between the Internet and a tenant’s network
* **Connection Broker (RDCB)**  
Distributes connections to RDSH servers
* **License Server (RDLic)**  
Tracks usage of the system
* **Session Host (RDSH)**  
User’s desktop and applications execute on the RDSH servers
--------------------------------------------------------------------------------------------


If you want to learn more...
- [Active Directory Domain Services (AD DS)](https://technet.microsoft.com/en-us/library/cc731053(WS.10&#41;.aspx)
- [Web Access (RDWeb)](https://technet.microsoft.com/en-us/library/cc731923(v=ws.11&#41;.aspx)
- [Gateway (RDGW)](https://technet.microsoft.com/en-us/library/cc731150(v=ws.11&#41;.aspx)
- [Connection Broker (RDCB)](https://technet.microsoft.com/en-us/library/cc772245(v=ws.11&#41;.aspx)
- [Licensing (RDLic)](https://technet.microsoft.com/en-us/library/cc725933(v=ws.11&#41;.aspx)
- [Session Host (RDSH)](https://technet.microsoft.com/en-us/library/cc742822(v=ws.11&#41;.aspx)
