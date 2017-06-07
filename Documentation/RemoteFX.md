# Deployment
## Admin Guide
---
* [Introduction](./README.md)
* [Architecture](./ArchitectureDiagram.md)
* Deployment
    * [Requirements](./Requirements.md)
    * [Basic deployment](./Deployment-basic.md)
    * [High Availability deployment](./Deployment-HA.md)
    * [Storage Spaces Direct (S2D) Scale-Out File Server (SOFS) Cluster](./S2DFileServer.md)
    * [User Access Web Certificate](./UserAccessWebCert.md)
    * [AzureAutomation](./AzureAutomation.md)
    * **[RemoteFX] (./RemoteFX.md)** <--
* [Admin Guide](./RemoteDesktopRemoteApp.md)
--- 

## RemoteFX

Microsoft® RemoteFX™ enables access to the Host de sesión de Escritorio remoto server from a wide range of client devices including rich clients, thin clients, and ultrathin clients. It also ensures lower bandwidth than Windows Server® 2008 R2 when transferring rich graphics applications. When used with a hardware-based application-specific integrated circuit (ASIC), the server running Windows Server 2008 R2 with SP1 is capable of hosting more sessions than previous versions.

## Installation
    1. Connect to the Session Host VM.
    2. We have to open the **Device Manager**, we'll notice that the driver for M60 video card will be missing.

         [](./images/remote1.png)
    3. Install the lastest [NVIDIA Drivers](http://www.nvidia.com/download/index.aspx).
         
         [](./images/remote2.png)
    4. After rebooting the VM, we have to disable the default display adapter.
        * Expand ‘Display adapters’, right click on ‘Microsoft Hyper-V Video’ and select ‘Disable’. 
    
        [](./images/remote3.png)
    5. Now we have to use only the main display and disable the second one. To configure this option we have to access to the VM using VNC.
        * We recommended [TightVNC](http://www.tightvnc.com/download.php). In the last step in the server installation, it will open the firewall ports. **Remember to open the port in the Network Security Group.**

        [](./images/remote4.png)

    6. After log in using VNC. 
        * We can see both displays.
        [](./images/remote5.png)
    
    7. Righ click on Desktop > "Display Settings".

        [](./images/remote6.png)
    8. Select "Show only on 2" in the Multiple display and "Apply".

        [](./images/remote7.png)
---
* [Introduction](./README.md)
* [Architecture](./ArchitectureDiagram.md)
* Deployment
    * [Requirements](./Requirements.md)
    * [Basic deployment](./Deployment-basic.md)
    * [High Availability deployment](./Deployment-HA.md)
    * [Storage Spaces Direct (S2D) Scale-Out File Server (SOFS) Cluster](./S2DFileServer.md)
    * [User Access Web Certificate](./UserAccessWebCert.md)
    * [AzureAutomation](./AzureAutomation.md)
    * **[RemoteFX] (./RemoteFX.md)** <--
* [Admin Guide](./RemoteDesktopRemoteApp.md)
--- 