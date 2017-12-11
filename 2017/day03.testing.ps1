'0','0','0'
'0','0','0'
'0','0','0'


$rows = 3
$cols = 3
$gridMatrix=@()
for ($i=(-$rows);$i -lt $rows; $i++){
  for ($j=(-$cols);$j -lt $cols;$j++){
    $newObj = New-Object psobject
    $newObj | Add-Member -MemberType NoteProperty -Name col -Value $j
    $newObj | Add-Member -MemberType NoteProperty -Name row -Value $i
    $newObj | Add-Member -MemberType NoteProperty -Name val -Value 0
    $newObj | Add-Member -MemberType NoteProperty -Name nSum -Value 0
      
    $gridMatrix += $newObj
    }

}


#set Initial Value
($gridMatrix | ? {$_.col -eq 0 -and $_.row -eq 0}).Val = 1
($gridMatrix | ? {$_.col -eq 0 -and $_.row -eq 0}).nSum = 1

$gridMatrix = $gridMatrix

<#
    foreach ($e in $gridMatrix) {
    Write-Host "working in $e"
  
    #SUM OUR NEIGHBORS
    # NORTH
    $rowid = $e.row + 1
    $colid = $e.col + 0
    $N = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOURTH
    $rowid = $e.row - 1
    $colid = $e.col - 0
    $S = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # EAST
    $rowid = $e.row + 0
    $colid = $e.col + 1
    $E = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # WEST
    $rowid = $e.row + 0
    $colid = $e.col - 1
    $W = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    #CORNERS
  
    # NORTHEAST
    $rowid = $e.row + 1
    $colid = $e.col + 1
    $NE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # NORTHWEST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $NW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHEAST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $SE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHWEST
    $rowid = $e.row - 1
    $colid = $e.col - 1
    $SW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
  
    $nSum = $N.val + $NE.val + $E.val + $SE.val + $S.val + $SW.val + $W.val + $NW.val 
    $e | Add-Member -MemberType NoteProperty -Name val -Value $nSum
  
    }
#>

function Process-Block ($block,$gridMatrix) {
  $e = $gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}
  Write-Host "working in $e"
  
    #SUM OUR NEIGHBORS
    # NORTH
    $rowid = $e.row + 1
    $colid = $e.col + 0
    $N = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOURTH
    $rowid = $e.row - 1
    $colid = $e.col - 0
    $S = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # EAST
    $rowid = $e.row + 0
    $colid = $e.col + 1
    $E = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # WEST
    $rowid = $e.row + 0
    $colid = $e.col - 1
    $W = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    #CORNERS
  
    # NORTHEAST
    $rowid = $e.row + 1
    $colid = $e.col + 1
    $NE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # NORTHWEST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $NW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHEAST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $SE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHWEST
    $rowid = $e.row - 1
    $colid = $e.col - 1
    $SW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
  
    $nSum = $N.val + $NE.val + $E.val + $SE.val + $S.val + $SW.val + $W.val + $NW.val 
    ($gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}).nSum = $nSum
    ($gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}).val = $nsum
    #$e | Add-Member -MemberType NoteProperty -Name val -Value $nSum
    }
    <#
    for ($i = 0; $i -lt $rows; $i++){
    for ($j = 0; $j -lt $cols; $j++) {
    $e = $gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}
    Write-Host "working in $e"
  
    #SUM OUR NEIGHBORS
    # NORTH
    $rowid = $e.row + 1
    $colid = $e.col + 0
    $N = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOURTH
    $rowid = $e.row - 1
    $colid = $e.col - 0
    $S = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # EAST
    $rowid = $e.row + 0
    $colid = $e.col + 1
    $E = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # WEST
    $rowid = $e.row + 0
    $colid = $e.col - 1
    $W = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    #CORNERS
  
    # NORTHEAST
    $rowid = $e.row + 1
    $colid = $e.col + 1
    $NE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # NORTHWEST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $NW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHEAST
    $rowid = $e.row - 1
    $colid = $e.col + 1
    $SE = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
    # SOUTHWEST
    $rowid = $e.row - 1
    $colid = $e.col - 1
    $SW = $gridMatrix | ? {$_.row -eq $rowid -and $_.col -eq $colid}
  
  
    $nSum = $N.val + $NE.val + $E.val + $SE.val + $S.val + $SW.val + $W.val + $NW.val 
    ($gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}).nSum = $nSum
    ($gridMatrix | ? {$_.row -eq $i -and $_.col -eq $j}).val = $nsum
    #$e | Add-Member -MemberType NoteProperty -Name val -Value $nSum
  
    }
    }

    $gridMatrix | sort nSum
#>


for ($i = 0; $i -lt $rows; $i++){
  for ($j = 0; $j -lt $cols; $j++) {
    Process-Block 
  }
}

$gridMatrix | sort nSum
