$gds = Get-Datastore
$capture = @()
foreach ($ds in $gds) {
$dsview = $ds | Get-View
$thisDS = "" | Select "DatastoreName","CanonicalName","OverallStatus","TotalSpaceTB","TotalSpaceGB","FreeSpaceGB","FreePercentage"
$thisDS."DatastoreName" = $ds.Name
$thisDS."CanonicalName" = $dsview.info.vmfs.extent
$thisDS."OverallStatus" = $dsview.OverallStatus
$thisDS."TotalSpaceTB" = $ds.CapacityGB/1024
$thisDS."FreePercentage" = ($ds.FreeSpaceGB/$ds.CapacityGB)*100
$thisDS."TotalSpaceGB" = $ds.CapacityGB
$thisDS."FreeSpaceGB" = $ds.FreeSpaceGB
$capture += $thisDS
}
$capture | Out-Gridview
