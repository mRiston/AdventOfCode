$challenge = Get-Content .\day01.input
$sum = 0
for ($i=0;$i -lt $challenge.Length; $i++) {
  $numtotest = $challenge[$i]
  <#
  Write-Host "Testing number   : $numtotest" -ForegroundColor Green -NoNewline
  Write-host " at index $i" -ForegroundColor Cyan
  #>
  $testingIndex = $i+($challenge.Length)/2

  if ($testingIndex -gt ( $challenge.Length - 1) ) { 
    $testingIndex = $testingIndex - $challenge.Length 
  }
  
  $numtocompare = $challenge[$testingIndex]
  <#Write-Host "Comparing against: $numtocompare at index " -NoNewline
  Write-Host  $testingIndex -ForegroundColor Cyan#>
  
  $testResult = $numtocompare -eq $numtotest
  <#Write-host 'Test validation ' -NoNewline
  Write-Host $testResult -ForegroundColor Green#>

  if ($testResult) {$sum += [int]$numtotest.ToString()}
  <#Write-Host 'current sum' -NoNewline
  Write-Host $sum -ForegroundColor Red
  Write-Host "" #>
}
$sum 