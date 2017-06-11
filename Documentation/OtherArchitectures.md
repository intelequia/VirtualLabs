# Other Architectures

## Standard RDS deployment architectures

Remote Desktop Services has two standard architectures:
+ Basic deployment – This contains the minimum recommended number of servers to create a fully effective RDS environment
+ Highly available deployment – This contains all necessary components to have the highest guaranteed uptime for your RDS environment


![Basic deployment](./images/basic-rds.png)

![Highly available deployment](./images/ha-rds.png)



## RDS architectures with unique Azure PaaS roles

Though the standard RDS deployment architectures fit most scenarios, Azure continues to invest in first-party PaaS solutions that drive customer value. Below are some architectures showing how they incorporate with RDS. 

### RDS deployment with Azure AD Domain Services

The two standard architecture diagrams above are based on a traditional Active Directory (AD) deployed on a Windows Server VM. However, if you don’t have a traditional AD and only have an Azure AD tenant—through services like Office365—but still want to leverage RDS,  
you can use Azure AD Domain Services to create a fully managed domain in your Azure IaaS environment that uses the same users that exist in your Azure AD tenant. This removes the complexity of manually syncing users and managing more virtual machines. Azure AD Domain Services can work in either deployment: basic or highly available.  

![RDS architectures with unique Azure PaaS roles](./images/aadds-rds.png)


### RDS deployment with Azure AD Application Proxy
The two standard architecture diagrams above use the RD Web/Gateway servers as the Internet-facing entry point into the RDS system. For some environments, administrators would prefer to remove their own servers from the perimeter and instead use technologies that also provide additional security through reverse proxy technologies. The Azure AD Application Proxy PaaS role fits nicely with this scenario. 

![RDS deployment with Azure AD Application Proxy](./images/aadappproxy-rds.png)


If you want to learn more
- [Remote Desktop Services architecture](https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/desktop-hosting-logical-architecture)

