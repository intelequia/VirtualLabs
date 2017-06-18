<#  
.SYNOPSIS  
    Vertically scale (up or down) an Azure SQL Database   
  
.DESCRIPTION  
    This runbook enables one to vertically scale (up or down) an Azure SQL Database using Azure Automation. 
    
    There are many scenarios in which the performance needs of a database follow a known schedule.
    Using the provided runbook, one could automatically schedule a database to a scale-up to a Premium/P1 
    database during peak hours (e.g., 7am to 6pm) and then scale-down the database to a Standard/S0 during
    non peak hours (e.g., 6pm-7am).

 .PARAMETER SqlServerName 
    Name of the Azure SQL Database server (Ex: bzb98er9bp) 
      
.PARAMETER DatabaseName  
    Target Azure SQL Database name

.PARAMETER Edition  
    Desired Azure SQL Database edition {Basic, Standard, Premium}
    For more information on Editions/Performance levels, please 
    see: http://msdn.microsoft.com/en-us/library/azure/dn741336.aspx

.PARAMETER PerfLevel  
    Desired performance level {Basic, S0, S1, S2, P1, P2, P3} 
 
.PARAMETER Credential  
    Credentials for $SqlServerName stored as an Azure Automation credential asset  
    When using in the Azure Automation UI, please enter the name of the 
    credential asset for the "Credential" parameter

.PARAMETER SubscriptionName
    Name Subscription

.PARAMETER ResourceName
    Resource Group Name Sql Server resource

.PARAMETER ConnectionName
    Connection Name of Automation Account
    
.EXAMPLE  
    Set-AzureSqlDatabaseEdition 
        -SqlServerName bzb98er9bp  
        -DatabaseName myDatabase
        -Edition Premium
        -PerfLevel P1
        -Credential myCredential 
        -SubscriptionName
        -ResourceName
        -ConnectionName
  
.NOTES  
    Author: Juan Pablo Blanco   
    Last Updated: 09/06/2017    
#> 

workflow Set-AzureSqlDatabaseEdition
{
    param
    (
        # Name of the Azure SQL Database server (Ex: bzb98er9bp)
        [parameter(Mandatory=$true)] 
        [string] $SqlServerName,

        # Target Azure SQL Database name 
        [parameter(Mandatory=$true)] 
        [string] $DatabaseName,

        # Desired Azure SQL Database edition {Basic, Standard, Premium}
        [parameter(Mandatory=$true)] 
        [string] $Edition,

        # Desired performance level {Basic, S0, S1, S2, P1, P2, P3}
        [parameter(Mandatory=$true)] 
        [string] $PerfLevel,

        # Credentials for $SqlServerName stored as an Azure Automation credential asset
        # When using in the Azure Automation UI, please enter the name of the credential asset for the "Credential" parameter
        [parameter(Mandatory=$true)] 
        [PSCredential] $Credential,

        #SubscriptionName
        [parameter(Mandatory=$true)] 
        [string] $SubscriptionName,

        #ResourceName
        [parameter(Mandatory=$true)] 
        [string] $ResourceName,

        #ConnectionName
        [parameter(Mandatory=$true)] 
        [string] $ConnectionName
    )
    
    inlinescript
    {

        $connectionName = "$Using:ConnectionName"    
        # Get the connection "AzureRunAsConnection"
        $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         
        "Logging in to Azure..."
        Add-AzureRmAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 

        
        Select-AzureRmSubscription -SubscriptionName "$Using:SubscriptionName"

        Write-Output "Begin vertical scaling script..."
       
        Write-Output "Establish credentials for Azure SQL Database server"
        $Servercredential = new-object System.Management.Automation.PSCredential($Using:Credential.UserName, (($Using:Credential).GetNetworkCredential().Password | ConvertTo-SecureString -asPlainText -Force)) 
        
        Write-Output "Get Azure SQL Database context"
        $Db = Get-AzureRmSqlDatabase -DatabaseName  $Using:DatabaseName -ResourceGroupName "$Using:ResourceName" -ServerName $Using:SqlServerName
        
        Write-Output "Specify the specific performance level for the target $DatabaseName"
        $ServiceObjective = Get-AzureRmSqlServerServiceObjective -ResourceGroupName "$Using:ResourceName" -ServerName "$Using:SqlServerName"   -DatabaseName "$Using:DatabaseName" 
        
        Write-Output "Set the new edition/performance level"
        Set-AzureRmSqlDatabase -ResourceGroupName "$Using:ResourceName" -DatabaseName $Using:DatabaseName -ServerName "$Using:SqlServerName"  -Edition $Using:Edition -RequestedServiceObjectiveName "$Using:PerfLevel"

        
        # Output final status message
        Write-Output "Scaled the performance level of $Using:DatabaseName to $Using:Edition - $Using:PerfLevel"
        Write-Output "Completed vertical scale"
    }
}
