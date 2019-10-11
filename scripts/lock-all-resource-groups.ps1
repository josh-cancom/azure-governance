param( 
    [parameter(Mandatory = $true)]
    [Validateset("sub1", "sub2", "sub3")]
    [string] $Environment
)

switch ($Environment) {
    "orr-core" { 
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
        $lockLevel = "ReadOnly"
    }
    "orr-prd" {
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
        $lockLevel = "ReadOnly"
    }
    "orr-pre" {
        $subId = "000000-41aa-42e6-8f44-63fb7c8bb32d"
        $lockLevel = "CanNotDelete"
    }
    Default { Throw "Invalid environment specified." }
}

Select-AzSubscription -SubscriptionId $subId

Get-AzResourceGroup | ForEach-Object {
    New-AzResourceLock -LockName RGLock -LockLevel $lockLevel -ResourceGroupName $_.ResourceGroupName -Force
}