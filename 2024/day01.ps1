$start = Get-Date
#region Example Verification
$list1 = '3','4','2','1','3','3'
$list2 = '4','3','5','3','9','3'

$len = $list1.Length
$sum = 0
for ($i=0; $i -lt $len; $i++) {
    #Write-Output "Processing position $i"
    $l1i = ($list1 | Sort-Object)[$i]
    $l2i = ($list2 | Sort-Object)[$i]
    $dist = $l1i-$l2i
    $sum += [math]::Abs($dist)
}

Write-Output "Part 2. Example Answer; $sum"
#endregion Example Verification

#region My Challenge
$MyInput = Get-Content ./day01.input.txt
$mylist1 = @()
$mylist2 = @()
foreach ($i in $MyInput) {
    $mylist1 += $i.Split(' ')[0]
    $mylist2 += $i.Split(' ')[-1]    
}
$len = $mylist1.Length
$sum = 0
for ($i=0; $i -lt $len; $i++) {
    #Write-Output "Processing position $i"
    $l1i = ($mylist1 | Sort-Object)[$i]
    $l2i = ($mylist2 | Sort-Object)[$i]
    $dist = $l1i-$l2i
    $sum += [math]::Abs($dist)
}

Write-Output "Part 1. My Answer; $sum"
#endregion My Challenge
#region Part 2 Ex
$len = $list1.Length
$sum = 0
for ($i=0; $i -lt $len; $i++) {
$l1i = $list1[$i]
$sum += ($list2 | ? {$_ -eq $l1i}).count * $l1i
}
Write-Output "Part 2 - Example Output: $sum"
#endregion Part 2 Ex

#region Part 2 My
$len = $mylist1.Length
$sum = 0
for ($i=0; $i -lt $len; $i++) {
$l1i = $mylist1[$i]
$sum += ($mylist2 | ? {$_ -eq $l1i}).count * $l1i
}
Write-Output "Part 2 - Example Output: $sum"
#endregion Part 2 My
Write-Output "Total Processing Time; $(New-TimeSpan -Start $start -End (Get-Date))"