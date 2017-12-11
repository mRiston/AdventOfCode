function Get-AOCInput ($path) {
  #$content = 
  Get-Content $path
  #return $content
}

$puzzle = Get-AOCInput .\day07.example.input
#$puzzle = Get-AOCInput .\day07.input

#region Part 1

$puzzle_orderly = @()
foreach ($p in $puzzle) {
  $children = $null
  $newObj = New-Object psobject 
  $name = $p.Split(' ') | select -First 1
  $iden = [int32](($p.Split('(') | Select-Object -First 1 -Skip 1).Replace(')','').split(' ') | select -First 1).Trim()
  $hasChildren = $p.contains('>')
  
  if ($hasChildren) {
    $children = ($p.Split('>').Trim() | select -Last 1 | Split-String -Separator ',').Replace(' ','');
  }
  
  $newObj | Add-Member -MemberType NoteProperty -Name name        -Value $name
  $newObj | Add-Member -MemberType NoteProperty -name ID          -Value $iden
  $newObj | Add-Member -MemberType NoteProperty -Name hasChildren -Value $hasChildren
  $newObj | Add-Member -MemberType NoteProperty -Name Children    -Value $children
  
  $puzzle_orderly = $puzzle_orderly += @($newObj)
}

$possibleBases = $puzzle_orderly | ? {$_.hasChildren -eq $true}
$rootBaseFound = $false
foreach ($base in $possibleBases) {
  if (!$rootBaseFound) {
    # Only process if we haven't found base 0
    if (!($base.name -in $possibleBases.children)) {
      $rootBase = $base
      $rootBaseFound = $true
    }
  }
}
Write-Host "Root Base is " -NoNewline
Write-Host "$($rootBase.Name) $($rootBase.ID)" -ForegroundColor Green

#endregion Part 1

#region Part 2

#$possibleBases
foreach ($p in $possibleBases) {
Write-host "Searching for $($p.Name)"
  $puzzle_orderly | ? {$_.name -in $p.Children}
  write-host " ---- "
  }

#endregion Part 2