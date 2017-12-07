$challenge = Get-Content .\day01.input
$sum = 0
$pos = 0
while ($pos -lt $challenge.Length){
  $numtoadd = $challenge[$pos]
  #$sum

  $i = 1

  while ($challenge[$pos+$i] -eq $numtoadd) {
    #Add this number again
    $sum += $numtoadd
    #increment $pos
    $pos++
  }
  $pos++
}
# Check last digit against first digit
if ($numtoadd -eq $challenge[0]) { $sum += $numtoadd }
#Report sum
$sum