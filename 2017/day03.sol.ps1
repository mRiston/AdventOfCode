function Generate-NewCircle ($steps) {
  $returnArray = New-Object -TypeName psobject
  $rowMin = $steps*$steps+1
  $returnArray | Add-Member -MemberType NoteProperty -Name rowMin -Value $rowMin
  $rowMax = ($steps+2)*($steps+2) #Only square odds
  $returnArray | Add-Member -MemberType NoteProperty -Name rowMax -Value $rowMax
  $returnArray | Add-Member -MemberType NoteProperty -Name steps  -Value ([int32]$steps+2)
  $returnArray
}
$target = 11
$foundtheRow = $false

$init = 1
if ($target -eq $init) { return "You started here!" }
ELSE {
$stepsToExtent = 1
  while (!$foundtheRow){
    # Gen array  for 1 step out from init
    $newRow = Generate-NewCircle $stepsToExtent
    if ($target -in $newRow.rowMin..$newRow.rowMax) {
      Write-Host "`"Dude, I found your number at $stepsToExtent steps away from your house!`" ~~Ashton Kutcher" -ForegroundColor Green
      $foundtheRow = $true
    }
    $stepsToExtent++
  }
}














while (!$foundtheRow) {
    if ($i % 2 -ne 0) {
    Write-Host $i -ForegroundColor Cyan
      # We have an odd nuimber
      $currentRow = [math]::Ceiling(($i/2))
      $rowMax = $i * $i * $i        ; Write-Host "Row MAX $rowMax"
      $rowMin = ($i - 1) * ($i - 1) ; Write-Host "Row MIN $rowMin"
      #Write-Host "Row $currentRow contains numbers $rowMin - $rowMax"
      $rowContents = $rowMin..$rowMax
   
      if ($target -in $rowContents) {$foundtheRow = $true}
      #$rowContents
    
    }
    $i++
    read-host
}
    Write-Host "Our number, $target, is in row $currentRow"
    

while (!$foundtheRow) {
  $currentRowMin = ($i)*($i)
  $currentRowMax = ($i+1)*($i+1)
  #$currentRowMin
  #$currentRowMax
  if ($target -in $currentRowMin..$currentRowMax) {$foundtheRow = $true}
  $i++
}

$correctRowWidth = $i -1 ;#$correctRowWidth
$correctRowMin = $currentRowMin;#$correctRowMin
$correctRowMax = $currentRowMax;# $correctRowMax



Write-Host "Rows to edge = $inc"

# Build our blocks
$directRight = $correctRowWidth
Write-host "RIGHT = $directRight"


















$directRight = $currentRowMin
$topRightCorner = $directRight + ($correctRowWidth-1)/2

if ($target -eq $topRightCorner) {Write-Host 'Top Right Corner, bruh'}
if ($target -in $directRight..$topRightCorner) { Write-Host "It's in the right row, top half" }

$topRow = $topRightCorner..($topRightCorner+$correctRowWidth)
if ($target -in $topRow) { Write-Host "It's in the top row" }

$locationInRow = $correctRowWidth - $topRow.IndexOf($target)

$directTop = [math]::Floor(($topRow | measure -Average).Average)
#$correctRowWidth-$locationInRow-($correctRowWidth/2)+$correctRowWidth
#$topRow.IndexOf($directTop)

$stepsToTarget = [math]::Floor($correctRowWidth/2) #Add steps to outer row
$rowMiddleSteps = [math]::Floor($correctRowWidth/2)
#$locationInRow - $rowMiddleSteps
$stepsOver = $locationInRow - $rowMiddleSteps - 1
if ($stepsOver -lt 0) { $stepsOver = $stepsOver * -1 } #Force a positive number. I don't care if its left or right
$stepsToTarget+=$stepsOver
$stepsToTarget