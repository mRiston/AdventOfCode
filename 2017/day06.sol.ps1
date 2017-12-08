function Get-AOCInput ($path) {
  Get-Content $path
}
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

$content = Get-AOCInput -path .\day06.input # Need to have the information, I suppose
#$content = Get-AOCInput -path .\test.input
#$content = Get-AOCInput -path .\test2.input # Totally wasn't trying to run this with day 5's input that caused me to write a test solution and solve it by hand...  Day 5's solution wasn't solving with this for some reason...
$static = $content # Static variable to confirm my input in Variable Viewer
$seenConfigs = @() # Create array to hold seen configs
$cycles = 0 # Create a counter for iterations completed

$sourceArray = $content -split '\t' #turn source into an array
$intArray = @() #temp holder for integer conversion
foreach ($block in $sourceArray) {                      #Convert initialarray into INT32 to make compare work cleaner
  $intArray = $intArray + @([convert]::ToInt32($block))   #Convert initialarray into INT32 to make compare work cleaner
}                                                         #Convert initialarray into INT32 to make compare work cleaner
$sourceArray = $intArray

while (($sourceArray -join ',') -notin $seenConfigs) {
  $seenConfigs += @($sourceArray -join ',')
  $sourceArray = Process-MemoryBankAllocationBalance $sourceArray
  $cycles ++
}
Write-Host "Hey, we've been here before! It took us " -NoNewline
Write-Host $cycles -ForegroundColor Green -NoNewline 
Write-Host " cycles."

$theDupe = $sourceArray

#Time to find part 2
$seentimes = 1
while ($seentimes -eq 1) {
  #if ($seenConfigs[-1] -eq ($sourceArray -join ',')){$seentimes++}
  #We've only found 1 reoccurence.
  # Keep going!
  $seenConfigs += @($sourceArray -join ',')
  $sourceArray = Process-MemoryBankAllocationBalance $sourceArray
  $cycles ++
  #if (($sourceArray -join ',' -eq ($intArray -join ','))) {$seentimes++}
  $seentimes = ($seenConfigs | ? {$_ -eq ($sourceArray -join ',')}).count
  
}