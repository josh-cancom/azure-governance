param( 
    [parameter(Mandatory = $true)]
    #If multiple subscriptions
    [Validateset("sub1", "sub2", "sub3")]
    [string] $Environment,

    [parameter(Mandatory = $true)]
    [string] $ResourceGroupName
)

switch ($Environment) {
    "sub1" { 
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
    }
    "sub2" {
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
    }
    "sub3" {
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
    }
    Default { Throw "Invalid environment specified." }
}

Select-AzSubscription -SubscriptionId $subId

Get-AzResourceLock | Where-Object ResourceGroupName -eq $ResourceGroupName | Remove-AzResourceLock -Force