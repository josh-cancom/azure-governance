#Continuous Assurance
#Detect from drift 
#CANCOM UK
#v0.1 - Josh Dean

#--------------------------------------------------------------------------------------------------------------------------------------------------#

#Connect-AzAccount
#Get-AzSubscription
$subid = '000000-cf70-45bd-82dd-e073710c6bf7'

#Install-Module AzSK -Scope CurrentUser -Force -AllowClobber

#Import Secure DevOps Kit for Azure - https://azsk.azurewebsites.net/00a-Setup/Readme.html
Import-Module AzSK
Set-AzSKPolicySettings -AutoUpdate On




#AzSK: Continuous Assurance (CA)
Get-AzSKContinuousAssurance -SubscriptionId $subid

#Install CA
Install-AzSKContinuousAssurance -SubscriptionId <SubscriptionId> `
            -ResourceGroupNames ‘rgName1, rgName2,…etc.’ ` # You can also use “*” to specify all RGs
            -LAWSId <WorkspaceId> `
            -LAWSSharedKey <SharedKey> 



#Alerting and monitoring needs setting up first - https://azsk.azurewebsites.net/05-Alerting-and-Monitoring/Readme.html#setting-up-the-azsk-monitoring-solution-step-by-step