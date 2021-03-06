function Get-PSKoanLocation {
    <#
    .SYNOPSIS
        Retrieves the set folder location where PSKoans' koan files are stored.

    .DESCRIPTION
        Returns the module-scoped PSKoanLocation variable.

    .EXAMPLE
        Get-PSKoanLocation

        C:\Users\Timmy\PSKoans
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param()
    process {
        if ($script:LibraryFolder) {
            $script:LibraryFolder
        }
        else {
            $ErrorDetails = @{
                Exception     = [System.IO.DirectoryNotFoundException]::new('PSKoans folder location has not been defined')
                ErrorId       = 'PSKoans.LibraryFolderNotDefined'
                ErrorCategory = 'NotSpecified'
                TargetObject  = $MyInvocation.MyCommand.Name
            }
            $PSCmdlet.ThrowTerminatingError( (New-PSKoanErrorRecord @ErrorDetails) )
        }
    }
}
