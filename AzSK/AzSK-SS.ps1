#Scan and secure subscriptions 
#CANCOM UK
#v0.1 - Josh Dean

#--------------------------------------------------------------------------------------------------------------------------------------------------#

#Connect-AzAccount
#Get-AzSubscription
$subid = '0000000-cf70-45bd-82dd-e073710c6bf7'

#Install-Module AzSK -Scope CurrentUser -Force -AllowClobber

#Import Secure DevOps Kit for Azure - https://azsk.azurewebsites.net/00a-Setup/Readme.html
Import-Module AzSK
Set-AzSKPolicySettings -AutoUpdate On


#1) AzSK: Subscription Health Scan - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html

    #Get a security report of the subscription (output to CSV) & output fix scripts
    Get-AzSKSubscriptionSecurityStatus -SubscriptionId $subid -GenerateFixScript

    #Run subscription fix script
    Repair-AzSKSubscriptionSecurity -ParameterFilePath <ParameterFilePath>

    #Get a security report of a RG (application)
    Get-AzSKAzureServicesSecurityStatus -SubscriptionId $subid -ResourceGroupNames RG1, RG2

    #Run services fix script
    Repair-AzSKAzureServicesSecurity -ParameterFilePath <ParameterFilePath>

#2) AzSK: Subscription Security Provisioning - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-subscription-security-provisioning

    #A set of mandatory accounts that are required for central scanning/audit/compliance functions.
    #A group of subscription and resource activity alerts for activities with significant security implications.
    #A baseline set of ARM policies corresponding to certain actions that are considered insecure.
    #Default enterprise policy settings for Azure Security Center (ASC).
    #Security contact information in ASC

    Set-AzSKSubscriptionSecurity -SubscriptionId $subid -SecurityContactEmails <SecurityContactEmails> -SecurityPhoneNumber <SecurityPoCPhoneNumber>


#3) AzSK: Subscription Access Control Provisioning - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-subscription-access-control-provisioning

    #Subscription Access Control Provisioning
    Set-AzSKSubscriptionRBAC -SubscriptionId $subid


#4) AzSK: Subscription Activity Alerts - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-subscription-activity-alerts

    Set-AzSKAlerts -SubscriptionId $subid -SecurityContactEmails <SecurityContactEmails> [-SecurityPhoneNumbers <SecurityPhoneNumbers>]


#5) AzSK: Azure Security Center (ASC) configuration - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-azure-security-center-asc-configuration

    Set-AzSKAzureSecurityCenterPolicies -SubscriptionId $subid -SecurityContactEmails <ContactEmails> -SecurityPhoneNumber <ContactPhone>


#6) AzSK: Subscription Security - ARM Policy - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-subscription-security---arm-policy

    Set-AzSKARMPolicies -SubscriptionId $subid


#7) AzSK: Update subscription security baseline configuration - https://azsk.azurewebsites.net/01-Subscription-Security/Readme.html#azsk-update-subscription-security-baseline-configuration

    Update-AzSKSubscriptionSecurity -SubscriptionId $subid