<#function Generate-NewCircle ($steps) {
    #if ($steps % 2 -eq 0) { $steps++ }
    $returnArray = New-Object -TypeName psobject
    $rowMin = ($steps)*($steps)+1
    $returnArray | Add-Member -MemberType NoteProperty -Name rowMin -Value $rowMin
    $rowMax = ($steps+2)*($steps+2) #Only square odds
    $returnArray | Add-Member -MemberType NoteProperty -Name rowMax -Value $rowMax
    $returnArray | Add-Member -MemberType NoteProperty -Name steps  -Value ([int32]$steps)
  
    $lowerRight = $rowMax
    $upperRight = $rowMin + $steps
    $upperLeft  = $upperRight + $steps + 1
    $lowerLeft  = $rowMax - $steps - 1
  
    $returnArray | Add-Member -MemberType NoteProperty -Name lowerLeft   -Value $lowerLeft
    $returnArray | Add-Member -MemberType NoteProperty -Name lowerRight  -Value $lowerRight
    $returnArray | Add-Member -MemberType NoteProperty -Name upperLeft   -Value $upperLeft
    $returnArray | Add-Member -MemberType NoteProperty -Name upperRight  -Value $upperRight
  
  
    $returnArray
    }
#>
function Generate-NewCircle ($steps) {
  if ($steps % 2 -eq 0) { } ELSE {#$steps++ }
    $returnArray = New-Object -TypeName psobject
    $rowMin = ($steps)*($steps)+1
    $returnArray | Add-Member -MemberType NoteProperty -Name rowMin -Value $rowMin
    $rowMax = ($steps+2)*($steps+2) #Only square odds
    $returnArray | Add-Member -MemberType NoteProperty -Name rowMax -Value $rowMax
    $returnArray | Add-Member -MemberType NoteProperty -Name steps  -Value ([int32]$steps)
  
    $lowerRight = $rowMax
    $upperRight = $rowMin + $steps
    $upperLeft  = $upperRight + $steps + 1
    $lowerLeft  = $rowMax - $steps - 1
  
    $returnArray | Add-Member -MemberType NoteProperty -Name lowerLeft   -Value $lowerLeft
    $returnArray | Add-Member -MemberType NoteProperty -Name lowerRight  -Value $lowerRight
    $returnArray | Add-Member -MemberType NoteProperty -Name upperLeft   -Value $upperLeft
    $returnArray | Add-Member -MemberType NoteProperty -Name upperRight  -Value $upperRight
  
  
    $returnArray
  }
}

#Generate-NewCircle 2
$target = 325489
#$target = read-host numbah?
while ($target -lt 1) { $target = read-host numbah? }
$foundtheRow = $false

$init = 1
$stepsToExtent = 0

if ($target -eq $init) { return "You started here!" }
ELSE {
  while (!$foundtheRow){
    $stepsToExtent++
    # Gen array  for 1 step out from init
    $newRow = Generate-NewCircle $stepsToExtent
    $stepsToExtent = $newRow.steps
    if ($target -in $newRow.rowMin..$newRow.rowMax) {
      Write-Host "`"Dude, I found your number at $stepsToExtent steps away from your house!`" ~~Ashton Kutcher" -ForegroundColor Green
      $stepsToExtent = [math]::Ceiling($stepsToExtent/2)
      Write-Host found it at row $stepsToExtent
      
      $foundtheRow = $true
    }
    ELSE {
      $stepsToExtent++
    }
  }
  
  
  #"37 36 35 34 33 32 31 56"
  #"38 17 16 15 14 13 30 55"
  #"39 18  5  4  3 12 29 54"
  #"40 19  6  1  2 11 28 53"
  #"41 20  7  8  9 10 27 52"
  #"42 21 22 23 24 25 26 51"
  #"43 44 45 46 47 48 49 50"
  Write-Host " 10   9    8   7   6   5   6   7   8   9  10  " -ForegroundColor Green                                                
  Write-Host " 101	100	99	98	97	96	95	94	93	92	91  " -NoNewLine; Write-Host "<-- 10" -ForeGroundColor Green
  Write-Host " 102	65	64	63	62	61	60	59	58	57	90  " -NoNewLine; Write-Host "<-- 09" -ForeGroundColor Green
  Write-Host " 103	66	37	36	35	34	33	32	31	56	89  " -NoNewLine; Write-Host "<-- 08" -ForeGroundColor Green
  Write-Host " 104	67	38	17	16	15	14	13	30	55	88  " -NoNewLine; Write-Host "<-- 07" -ForeGroundColor Green
  Write-Host " 105	68	39	18	 5	 4   3	12	29	54	87  " -NoNewLine; Write-Host "<-- 06" -ForeGroundColor Green
  Write-Host " 106	69	40	19	 6	 1   2	11	28	53	86  " -NoNewLine; Write-Host "<-- 05" -ForeGroundColor Green
  Write-Host " 107	70	41	20	 7 	 8   9	10	27	52	85  " -NoNewLine; Write-Host "<-- 06" -ForeGroundColor Green
  Write-Host " 108	71	42	21	22	23	24	25	26	51	84  " -NoNewLine; Write-Host "<-- 07" -ForeGroundColor Green
  Write-Host " 109	72	43	44	45	46	47	48	49	50	83  " -NoNewLine; Write-Host "<-- 08" -ForeGroundColor Green
  Write-Host " 110	73	74	75	76	77	78	79	80	81	82  " -NoNewLine; Write-Host "<-- 09" -ForeGroundColor Green
  Write-Host " 111	112	113	114	115	116	117	118	119	120	121 " -NoNewLine; Write-Host "<-- 10" -ForeGroundColor Green
                                                
  
  $idfk = [math]::Ceiling([math]::Sqrt($stepsToExtent))+1

  $lowerRight = $newRow.lowerRight
  $lowerLeft  = $newrow.lowerLeft
  $upperLeft  = $newRow.upperLeft
  $upperRight = $newRow.upperRight
  
  Write-Host "$upperLeft          $upperRight"
  Write-Host "         1                "
  Write-Host "$lowerLeft          $lowerRight"
  
  Write-Host "Steps to extent = " -NoNewline
  Write-host $stepsToExtent -ForegroundColor Cyan -BackgroundColor Black
  
  
  #Now, find where our $target resides
  Write-Host "Looking for $target" -ForegroundColor red
  $targetAcquired=$false
  $targetIndex = $null
  #Check lower side first because why not
  if ($target -in $lowerLeft..$lowerRight) { 
    $targetAcquired = $true
    Write-Host 'Found it in the bottom side'
    $targetIndex = $lowerLeft..$lowerRight
  }
  if (!$targetAcquired) {
    if ($target -in $lowerLeft..$upperLeft) {
      $targetAcquired = $true
      Write-Host 'Found it in the left side'
      $targetIndex = $lowerLeft..$upperLeft
    }
  }
  if (!$targetAcquired) {
    if ($target -in $upperLeft..$upperRight) {
      $targetAcquired = $true
      Write-Host 'Found it in the top side'
      $targetIndex = $upperLeft..$upperRight
    }
  }
  if (!$targetAcquired) {
    if ($target -in $upperRight..$newRow.rowMin -or $newRow.rowMax) {
      $targetAcquired = $true
      Write-Host 'Found it in the right side'
      $targetIndex = $upperRight..$newRow.rowMin
      $targetIndex = $targetIndex + @($newRow.rowMax)
    }
  }   
  
}

$middleOfRow = $targetIndex[([math]::Floor($targetIndex.Count/2))]
$specificAdjustment = $target - $middleOfRow
if ($specificAdjustment -lt 0) { $specificAdjustment = $specificAdjustment * -1 }

$TotalSteps = $stepsToExtent + $specificAdjustment

Write-Host "Target value of " -NoNewline
Write-Host $target -ForegroundColor Cyan -NoNewline
Write-Host ' is located ' -NoNewline
Write-Host $TotalSteps -ForegroundColor Green -NoNewline
Write-Host ' steps away from index0.'

if ($target -eq 325489) {
  Write-Host "835,834" -NoNewline -ForegroundColor White -BackgroundColor gray
  Write-Host ' is not the answer.'
}