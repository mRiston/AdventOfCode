[string]$challenge = Get-Content .\day01.input
$pos = 0
[int]$sum = 0
[string]$numtoadd=$challenge.ToString()[$pos] #Store the beginning number
$pos++ # Advance to the second digit - we've already stored the first
while ($pos -lt $challenge.ToString().Length) {
  if ($challenge.ToString()[$pos] -eq $numtoadd) {
    # Success - we've found a match.
    # Add it to our summary array
    $sum += $numtoadd
    # Advance $pos to next Digit an extra time and store that in $numtoadd
    $pos++ 
      $numtoadd = $challenge.ToString()[$pos] 
    } else {
      #Do nothing, the number in $pos doesn't match
    }
    #Advance $pos for while loop
    $pos++
}
$sum