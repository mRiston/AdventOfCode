function Get-AOCInput ($path) {
  #$content = 
  Get-Content $path
  #return $content
}

$content = Get-AOCInput -path .\day04.input
$validPhrases = 0

foreach ($phrase in $content) {
  $phraseWords = $phrase -split '\s'
  if (($phraseWords | select -Unique).count -eq $phraseWords.count) { $validPhrases++ } 
}

Write-Host "Day 04 Part 1 Solution: " -NoNewline;Write-Host "$validPhrases" -ForegroundColor Green