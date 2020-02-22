$global:counter = 1
function Test-RecursionInBeginBlock {
<#     12/02/2020 19:48:27: Entering Begin Block. Counter value = 1
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 2
        Employee ID = John
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 3
        Employee ID = Terry
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 4
        Employee ID = Issac
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 5
        Employee ID = Helter
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 6
        Employee ID = Barry
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 7
        Employee ID = Kean
        12/02/2020 19:48:27: Entering Begin Block. Counter value = 8
        Employee ID = Marlin
        No Employee ID presented 
        -----------------
        Note that the begin block is entered with each item
        #>
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ParameterSetName = 'ID')]
        [String[]]
        $ID, 
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ParameterSetName = 'CSV')]
        [String[]]
        $CSVpath 
    )
   begin{
       Write-Host "$(Get-Date): Entering Begin Block. Counter value = $global:counter"
       $global:counter++
       if($CSVpath){
           Import-Csv -Path $CSVpath | ForEach-Object{
               Test-RecursionInBeginBlock -ID $_.Employee
           }
       }
   } 
   process{
       if($ID){
           Write-Host "Employee ID = $ID"
       }
       else{
           Write-Host "No Employee ID presented"
       }
   }
}