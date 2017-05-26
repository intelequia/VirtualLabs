

![RDS](./Documentation/imagenes/rds-overview.png)

**"Bring your own device" and mobility** are two of the concepts that are transforming the way that Education is evolving in the era of the cloud. Increasingly, teachers are demanding to IT teams in schools and universities to have their resources, such as applications, available regardless the location they teach at. Besides, students also require to access those kinds of educational applications at any time, at any place and with any device (smartphone, tablet, home PC) they are connecting from.

In this scenario, where the IT teams are facing **the new way of teaching and learning** , they are struggling to find the right solution which meet the demands coming from students and teachers and simultaneously, comply with the security policies of their current technological environment.

**Virtual Lab in Azure** is the **Microsoft Cloud Solution for Education** which provide the suitable combination of infrastructure and services to help IT teams in schools and universities to achieve these common goals:

- To reduce the cost of their current infrastructure on premises of the virtual lab.
- To provide mobility to the students to access the applications of the virtual lab anywhere, anytime and from any device.
- To improve the efficiency of their internal processes in managing permissions to the students, publishing the applications, monitoring the usage or scaling out the platform based on demand of concurrent users.
- To connect the virtual lab to their virtual private network (VPN) to comply with their security policies.

Schools and universities which have already deployed the **Virtual Lab in Azure** are experiencing the benefits of transferring the computation capacity from the user devices to the cloud machines.

Due to the applications used by elementary students are extremely different than those used by, for example, an Engineering student in terms of computer performance, the **solution is completely flexible and adaptive** to serve, using remote sessions, just the applications required by any academic level or student profile.

The customer´s testimony below summarised precisely what the **Virtual Lab in Azure** has supposed to them:

&quot;_In our decision-making process, we considered positively that with Azure we were able to pay just for the real usage as the solution was adapted to our calendars and academic timetables. Besides, it was 25% cheaper than the competitor´s solutions and it met our needs about to customize deployments of the virtual lab. On top of that, we could turn on/off services on the go and the integration with our local IT environment was also met_.&quot;

Luis Fco. Blanco
IT Director
Universidad Pontificia Comillas-ICAI-ICADE [Madrid]

## concepts
Tenant environment
The provider's desktop hosting service is implemented as a set of isolated tenant environments. 

Remote Desktop Web Access
The Remote Desktop Web Access (RD Web Access) component allows the tenant's employees to have a single website where they can authenticate and then access Windows desktops and applications that are hosted in Microsoft Azure

Remote Desktop Gateway
The Remote Desktop Gateway (RD Gateway) component enables tenant employees who are using client devices on the public Internet to securely access Windows desktops and applications that are hosted in a Cloud Service in Microsoft Azure.

Azure Active Directory Domain Services
The tenant's network includes Azure Active Directory Domain Services (AAD DS) for the tenant's forest and domain. Using AAD DS allows the tenant to manage groups and users in their AAD tenant, with all changes syncing back to the domain on a recurring basis.

Azure SQL Database
Azure SQL Database allows for hosters to extend their Remote Desktop Services deployment without needing to deploy and maintain a full SQL Server Always-On cluster.

Azure Active Directory Application Proxy
Azure Active Directory Application Proxy is a service provided in paid-SKUs of Azure Active Directory that allow users to connect to internal applications through Azure's own reverse-proxy service.

Remote Desktop Connection Broker
Remote Desktop Connection Broker (RD Connection Broker) manages incoming remote desktop connections to the servers in Remote Desktop Session Host (RD Session Host) server farms, known as collections. 

Remote Desktop Licensing
Each tenant's environment includes an activated Remote Desktop Licensing server to allow users to connect to the Remote Desktop Session Host (RD Session Host) servers that host the tenant's desktops and applications.

Remote Desktop Session Host
The Remote Desktop Session Host (RD Session Host) component provides a tenant's users with session-based desktops and RemoteApp programs. 

File server
The file server provides shared folders by using the Server Message Block (SMB) 3.0 protocol. 

User Profile Disks

User profile disks allow users to save personal settings and files when they are signed in to a session on an RD Session Host server in a collection, and then have access to the same settings and files when signing in to a different RD Session Host server in the collection.

For more information (https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/desktop-hosting-service)



## Getting Started

[Welcome!](Documentation/GettingStarted.md)  These instructions will help you to understand Remote Desktop Services solution and set up the project components for cloud deployment. 

### Prerequisites

The set of softwares and subscriptions for usage and deployment of the project are mentioned in the [requirements](Documentation/Requirement.md) document.

### Architecture

Refer to the [solution architecture](Documentation/SolutionArchitecture.md) guide. 

### Deployment 

Refer to the [deployment](Documentation/DeploymentSteps.md) guide. 


## Built With



## License

This project has adopted the [Microsoft Open Source Code of Conduct] (https://opensource.microsoft.com/codeofconduct/). For more information, see the [Code of Conduct FAQ] (https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com] (mailto:opencode@microsoft.com) with any additional questions or comments.

The MIT License (MIT)

Copyright (c) 2016 Microsoft

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.