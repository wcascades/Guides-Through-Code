$global:counter = 1
function Test-RecursionInBeginBlock {
<#      SAMPLE OUTPUT ----
        12/02/2020 21:36:33: Entering Begin Block. Counter value = 1
        arr type = System.Object[]
        arr value is John Terry Issac Helter Barry Kean Marlin
        Length of arr = 7
        12/02/2020 21:36:33: Entering Begin Block. Counter value = 2
        Global counter = 3
        Employee ID = John
        Global counter = 3
        Employee ID = Terry
        Global counter = 3
        Employee ID = Issac
        Global counter = 3
        Employee ID = Helter
        Global counter = 3
        Employee ID = Barry
        Global counter = 3
        Employee ID = Kean
        Global counter = 3
        Employee ID = Marlin
        No Employee ID presented
        ------------------------------
        Note that the Begin block is only entered twice!
        - This will NOT work with Parameter sets.
        - Last line of output is the final run of the process 
          block from the original function call with using
          the .csv file#>
    param(
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $true)]
        [string[]]
        $ID, 
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [String[]]
        $CSVpath 
    )
    begin {
        Write-Host "$(Get-Date): Entering Begin Block. Counter value = $global:counter"
       $global:counter++
       $arr = @() 
       if ($CSVpath) {
           Import-Csv $CSVpath | ForEach-Object {
              $arr += $_.Employee
            }
            Write-Host "arr type = $($arr.GetType())"
            Write-Host "arr value is $arr"
            Write-Host "Length of arr = $($arr.length)"
            $arr | Test-RecursionInBeginBlock
        }
    } 
    process {
       if ($ID) {
          Write-Host "Global counter = $($global:counter)"
          Write-Host "Employee ID = $ID"
       }
        else {
           Write-Host "No Employee ID presented"
       }
    }
}