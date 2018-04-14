# Setting up RemoteFX on N-Series

Microsoft® RemoteFX™ enables access to the RDS Host Server from a wide range of client devices including rich clients, thin clients, and ultrathin clients. It also ensures lower bandwidth than Windows Server® when transferring rich graphics applications. When used with a hardware-based application-specific integrated circuit (ASIC), the server running Windows Server is capable of hosting more sessions than previous versions.

To take advantage of the GPU capabilities, you must install NVIDIA graphics drivers on each VM after deployment.

## Supported GPU drivers
Connect by Remote Desktop to each N-series VM. Download, extract, and install the supported driver for your Windows operating system +
NVIDIA Tesla drivers for NV VMs (Tesla M60)

## Driver  NVIDIA 

#### NVIDIA GRID drivers for NV VMs (Tesla M60)
Windows Server 2016	[Download](https://go.microsoft.com/fwlink/?linkid=836843). 

   NOTE: check for the latest instructions available on the [Azure Documentation Portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/n-series-driver-setup) and [NVIDIA](http://www.nvidia.com/) website.

### Installation

1. Connect to the Session Host VM.
2. We have to open the **Device Manager**, we'll notice that the driver for M60 video card will be missing.
   ![](./images/remote1.png)
3. Install the [NVIDIA GRID Drivers for VN VMs (Tesla M60)](https://go.microsoft.com/fwlink/?linkid=836843).   
4. Reboot the VM.
    
### Verify GPU driver installation
On Azure NV VMs, a restart is required after driver installation. To query the GPU device state, run the [nvidia-smi](https://developer.nvidia.com/nvidia-system-management-interface) command-line utility installed with the driver.

![](./images/smi.png)
  
### Group Policy settings
   * The following Group Policy settings allow you to configure RemoteFX within your environment. Note that when joining the server to the Session Host collection, you can get a warning indicating that the local group policies are different. You will need to setup these policies through the Group Policy Management console (GPMC) on the domain controller. Once that you have setup them, run the command "gpupdate" on a console on the local server to avoid waiting the automatic policiy refresh that happens every 5 minutes.    

| Group Policy setting name | Location | Description | Default value |
| :---  | :---  | :--- | :---  |
| Use the hardware default graphics adapter for all Remote Desktop Services sessions        | Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host \Remote Session Environment | If you **enable** this policy setting, all Remote Desktop Services sessions use the hardware graphics renderer instead of the Microsoft Basic Render Driver as the default adapter. | If you do not configure this policy setting, Remote Desktop Services sessions on the RD Session Host server use the Microsoft Basic Render Driver as the default adapter. |
| Limit number of monitors        | Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host \Remote Session Environment | Set Maximum monitors to 1.  If you **enable** this policy setting, you can specify the number of monitors that can be used to display a Remote Desktop Services session. You can specify a number from 1 to 16. | If you disable or do not configure this policy setting, the number of monitors that can be used to display a Remote Desktop Services session is not specified at the Group Policy level. |
| Allow RDP redirection of other supported RemoteFX USB devices from this computer | Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Connection Client\RemoteFX USB Redirection | Set RemoteFX USB Redirection Access Rights to **Administrators Only**.  If you **enable** this policy setting, you can choose to give the ability to redirect other supported RemoteFX USB devices over RDP to all users or only to users who are in the Administrators group on the computer. | If you disable or do not configure this policy setting, other supported RemoteFX USB devices are not available for RDP redirection by using any user account. |
| Do not allow supported Plug and Play device redirection | Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host \Device and Resource Redirection | If you **disable** this policy setting, users can redirect their supported Plug and Play devices to the remote computer. Users can use the More option on the Local Resources tab of Remote Desktop Connection to choose the supported Plug and Play devices to redirect to the remote computer. | By default, Remote Desktop Services does not allow redirection of supported Plug and Play and RemoteFX USB devices. |

