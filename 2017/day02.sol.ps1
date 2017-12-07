$input = Get-Content .\day02.input
$checksum = 0
foreach ($line in $input.Split('
'))
{
  #Create an array
  $lineArray = $line -split '\s'
  #Sort Array
  $lineArray = $lineArray | Sort-Object -Property @{
    E = {
      $_ -as [int]
    }
  }
  $lineMin = $lineArray | Select-Object -First 1
  $lineMax = $lineArray | Select-Object -Last 1
  #"Hash" our line
  $lineDiff = $lineMax-$lineMin
  # Add Line has to checksum holder
  $checksum += $lineDiff
}
$checksum