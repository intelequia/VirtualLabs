# **Template execution steps**

## Basic deployment
The Azure Resource Manager template ‘rds-base-azuredeploy.json’ creates a Virtual Network, three subnets (Frontend, Backend and SessionHost ones) and a Standard Storage account in which vhds will be stored.
It is linked to other templates, this enable us decomposing our deployment into a set of targeted, purpose-specific templates:
* **rds-nsg-azuredeploy.json**  
This template help us to specify which ports should be opened in each subnet in order allow internal and external RDS communications
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
