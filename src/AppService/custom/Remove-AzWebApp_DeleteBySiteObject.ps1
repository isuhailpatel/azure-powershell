function Remove-AzWebApp_DeleteBySiteObject {
    [Alias('Remove-AzWebAppSlot')]
    [OutputType('System.Boolean')]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess)]
    [Microsoft.Azure.PowerShell.Cmdlets.AppService.Profile('latest-2019-04-30')]
    [Microsoft.Azure.PowerShell.Cmdlets.AppService.Description('Deletes a web, mobile, or API app, or one of the deployment slots.')]
    param(
        [Parameter(Mandatory, HelpMessage='Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.Info(SerializedName='subscriptionId', Required, PossibleTypes=([System.String]), Description='Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).
        ${SubscriptionId},

        [Parameter(Mandatory, HelpMessage='The object representation of the web app or slot.')]
        [Alias('WebApp', 'WebAppSlot')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20180201.ISite]
        ${SiteObject},

        [Parameter(HelpMessage='Specify true if the App Service plan will be empty after app deletion and you want to delete the empty App Service plan. By default, the empty App Service plan is not deleted.')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Query')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.Info(SerializedName='deleteEmptyServerFarm', PossibleTypes=([System.Management.Automation.SwitchParameter]), Description='Specify true if the App Service plan will be empty after app deletion and you want to delete the empty App Service plan. By default, the empty App Service plan is not deleted.')]
        [System.Management.Automation.SwitchParameter]
        # Specify true if the App Service plan will be empty after app deletion and you want to delete the empty App Service plan. By default, the empty App Service plan is not deleted.
        ${DeleteEmptyServerFarm},

        [Parameter(HelpMessage='If true, web app metrics are also deleted.')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Query')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.Info(SerializedName='deleteMetrics', PossibleTypes=([System.Management.Automation.SwitchParameter]), Description='If true, web app metrics are also deleted.')]
        [System.Management.Automation.SwitchParameter]
        # If true, web app metrics are also deleted.
        ${DeleteMetric},

        [Parameter(HelpMessage='When specified, PassThru will force the cmdlet return a ''bool'' given that there isn''t a return type by default.')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # When specified, PassThru will force the cmdlet return a 'bool' given that there isn't a return type by default.
        ${PassThru},

        [Parameter(HelpMessage='The credentials, account, tenant, and subscription used for communication with Azure.')]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter(DontShow, HelpMessage='Wait for .NET debugger to attach')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be appended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be prepended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter(DontShow, HelpMessage='The URI for the proxy server to use')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow, HelpMessage='Credentials for a proxy server to use for the remote call')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow, HelpMessage='Use the default credentials for the proxy')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        $Tokens = $SiteObject.Id.Split("/", [System.StringSplitOptions]::RemoveEmptyEntries)
        $null = $PSBoundParameters.Add("ResourceGroupName", $Tokens[3])
        $null = $PSBoundParameters.Add("Name", $Tokens[7])
        if ($Tokens.Length -eq 10)
        {
            $null = $PSBoundParameters.Add("Slot", $Tokens[9])
        }

        $null = $PSBoundParameters.Remove("SiteObject")
        Az.WebSite\Remove-AzWebApp @PSBoundParameters
    }
}