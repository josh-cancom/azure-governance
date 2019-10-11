New-AzManagementGroup -GroupName 'Contoso' -DisplayName 'Contoso Group'

$parentGroup = Get-AzManagementGroup -GroupName Contoso
New-AzManagementGroup -GroupName 'ContosoSubGroup' -ParentId $parentGroup.id