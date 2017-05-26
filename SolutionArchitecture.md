# Azure Remote Desktop Services
### What is Remote Desktop Services?
Remote Desktop Services (RDS) is the platform of choice for building virtualization solutions for every end customer need, including  
delivering individual virtualized applications,   providing secure mobile and remote desktop access, and providing end users the ability  to run their 
applications and desktops from the cloud.

### Standard RDS deployment architectures

Remote Desktop Services has two standard architectures:
+ Basic deployment – This contains the minimum number of servers to create a fully effective RDS environment
+ Highly available deployment – This contains all necessary components to have the highest guaranteed uptime for your RDS environment


![Basic deployment](./imagenes/basic-rds.png)

![Highly available deployment](./imagenes/ha-rds.png)



### RDS architectures with unique Azure PaaS roles

Though the standard RDS deployment architectures fit most scenarios, Azure continues to invest in first-party PaaS solutions that drive customer 
value.  
Below are some architectures showing how they incorporate with RDS. 
RDS deployment with Azure AD Domain Services

The two standard architecture diagrams above are based on a traditional Active Directory (AD) deployed on a Windows Server VM. However,  
if you don’t have a traditional AD and only have an Azure AD tenant—through services like Office365—but still want to leverage RDS,  
you can use Azure AD Domain Services to create a fully managed domain in your Azure IaaS environment that uses the same users that exist in your   
Azure AD tenant. This removes the complexity of manually syncing users and managing more virtual machines.   
Azure AD Domain Services can work in either deployment: basic or highly available.  

![RDS architectures with unique Azure PaaS roles](./imagenes/aadds-rds.png)


### RDS deployment with Azure AD Application Proxy
The two standard architecture diagrams above use the RD Web/Gateway servers as the Internet-facing entry point into the RDS system.  
For some environments, administrators would prefer to remove their own servers from the perimeter and instead use technologies   
that also provide additional security through reverse proxy technologies. The Azure AD Application Proxy PaaS role fits nicely with this scenario.  

![RDS deployment with Azure AD Application Proxy](./imagenes/aadappproxy-rds.png)


### RDS architecture proposal in this lab 
* RDS basic

![RDS basic architecture](./imagenes/Architecture%20basic.png)

* RDS High availabity architecture

![RDS High availabity architecture](./imagenes/Architecture%20HA.png)


If you want to learn more
- [Active Directory Domain Services (AD DS)](https://technet.microsoft.com/en-us/library/cc731053(WS.10&#41;.aspx)
- [Web Access (RDWeb)](https://technet.microsoft.com/en-us/library/cc731923(v=ws.11&#41;.aspx)
- [Gateway (RDGW)](https://technet.microsoft.com/en-us/library/cc731150(v=ws.11&#41;.aspx)
- [Connection Broker (RDCB)](https://technet.microsoft.com/en-us/library/cc772245(v=ws.11&#41;.aspx)
- [Licensing (RDLic)](https://technet.microsoft.com/en-us/library/cc725933(v=ws.11&#41;.aspx)
- [Session Host (RDSH)](https://technet.microsoft.com/en-us/library/cc742822(v=ws.11&#41;.aspx)
- [integrated Windows authentication](https://technet.microsoft.com/en-us/library/cc732841(v=ws.11&#41;.aspx)
- [Remote Desktop Services architecture](https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/desktop-hosting-logical-architecture)

