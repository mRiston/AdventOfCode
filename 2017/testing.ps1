$sourceArray = Get-Content .\test.input
$sourceArray = $sourceArray -split '\t'
$sourceArray

$intArray = @() #temp holder for integer conversion
foreach ($block in $sourceArray) {                      #Convert initialarray into INT32 to make compare work cleaner
  $intArray = $intArray + @([convert]::ToInt32($block))   #Convert initialarray into INT32 to make compare work cleaner
}                                                         #Convert initialarray into INT32 to make compare work cleaner
$sourceArray = $intArray
function Process-MemoryBankAllocationBalance ($blockArray) {
  $blockMax = ($blockArray | Measure-Object -Maximum).Maximum

  $blockMaxIndex = $blockArray.IndexOf([int32]$blockMax)
  
  $newArray = $blockArray
  $numToDecrement = $blockMax
  $currentArrayIndex = $blockMaxIndex # Set starting loction at Max
  $newArray[$currentArrayIndex] = 0 #Set this to 0
  #for ($i=0;$i -lt $currentarrayindex; $i++){Write-Host "  " -NoNewline}; Write-host "V" -ForegroundColor Green; write-host $newArray
  
  while ($numToDecrement -gt 0) {
    $currentArrayIndex ++ # Move to our next array index.
    if ($currentArrayIndex -ge ( $newArray.length ) ) {
      # We're past the extets of the array. Reset to index 0 to loop back to beginning
      $currentArrayIndex = 0
    }
    
    $newArray[$currentArrayIndex] = $newArray[$currentArrayIndex] + 1 #Increment new index array.
    $numToDecrement-- # Decrement our counter
  }
  return $newArray
}

$sourceArray = Process-MemoryBankAllocationBalance $sourceArray
$sourceArray -join ','
$sourceArray = Process-MemoryBankAllocationBalance $sourceArray
$sourceArray -join ','
$sourceArray = Process-MemoryBankAllocationBalance $sourceArray
$sourceArray -join ','