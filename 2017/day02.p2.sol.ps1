$checksum = 0
foreach ($line in (Get-Content .\day02.input)) {
  $lineArray = $line -split '\t'
  function Test-Remainder ($1,$2) { if ($1 % $2 -eq 0) {$true} ELSE {$false}}
  $foundourmatch = $false
  foreach ($number in $lineArray) {
    if (!$foundourmatch) {
      foreach ($entry in $lineArray) {
        if ($number -eq $entry -and $foundourmatch -eq $false) {} #skip yourself
        ELSE {
          if (Test-Remainder $number $entry) { $checksum += ($number / $entry); $foundourmatch = $true}
          if (Test-Remainder $entry $number) { $checksum += ($entry / $number); $foundourmatch = $true}
        }
      }
    }
  }
}
  
  Write-Host $checksum -ForegroundColor green -BackgroundColor black