xquery version "1.0-ml";

let $uris:= cts:uris((),(),cts:collection-query(("MasterPlannerConfig")))
let $paths := 
  for $i at $x in $uris   
  let $doc := cts:search(/masterPlannerConfig,cts:document-query("/MasterPlannerConfig/"||$x))
  let $nav_configs := $doc/navigationConfigs
  let $nav_config_paths :=
    for $j in $nav_configs
      return
        if(exists($j/navigationConfig)) then
          $j/navigationConfig
        else
          ()
    return $nav_config_paths

for $k in $paths
let $var1 := <userGroup>IT Design Architect</userGroup>
return
  xdmp:node-insert-after($k/onFailure,$var1)