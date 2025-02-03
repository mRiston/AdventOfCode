$MyInput = Get-Content ./day02.input.txt
$ExInput = Get-Content ./day02.ex.input.txt
$start = Get-Date
#region P1 Example
$safeReports = @()
foreach ($Report in $ExInput) {
    $valid = $true #assume valid
    if ($Report[0] -gt $Report[1]) {
        $velocity = "+" 
    } elseif ($Report[0] -eq $Report[1]){
        $valid = $false
    }
    else {$velocity = "-"}
    for ($i=0; $i -lt $Report.Length; $i++){
        if ($i=0){
            #First in sequence, assume valid. Store value for future use.
            $prevVal = $i
        }
        else {
            # Not the first value. We run tests.
            while ($valid) {
                if ($i-$prevVal -gt 3) {$valid = $false}
                if ($velocity -eq "+") {
                    if ($i -lt $prevVal) {$valid = $false}
                }
                if ($velocity -eq "-") {
                    if ($i -gt $prevVal) {$valid = $false}
                }                
            }
            if ($valid) {$safeReports += $Report}

            #Finally, store current value for verifications
            $prevVal = $i
        }
    }
}
#endregion P1 Example