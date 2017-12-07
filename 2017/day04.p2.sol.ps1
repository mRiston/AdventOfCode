function Get-AOCInput ($path) {
  #$content = 
  Get-Content $path
  #return $content
}

$content = Get-AOCInput -path .\day04.input
$validPhrases = 0
$validPWds = @()
foreach ($phrase in $content) {
  $phraseWords = $phrase -split '\s'
  if (($phraseWords | select -Unique).count -eq $phraseWords.count) { $validPhrases++ ; $validPWds += $phrase } 
}

Write-Host "Day 04 Part 1 Solution: " -NoNewline;Write-Host "$validPhrases" -ForegroundColor Green

$valid = 0
foreach ($phrase in $validPWDs) {
  $phraseWords = $phrase -split '\s'
  
  $sortedphrasewords = $null
  foreach ($word in $phraseWords) {
    $sortedPhraseWords = @($(Join-String ($word -split '' | sort))) + $sortedphrasewords
  }
  $sortedphrasewords = $sortedphrasewords -split '\s'
  $badphrase = $false
  
  foreach ($word in $sortedphrasewords -and !$badphrase) {
    if (($sortedphrasewords | Select-Object -Unique).count -eq $sortedphrasewords.count) { $valid++ }
    ELSE {$badphrase = $true}
   } 
}
Write-Host "Day 04 Part 2 Solution: " -NoNewline;Write-Host $valid -ForegroundColor Green
