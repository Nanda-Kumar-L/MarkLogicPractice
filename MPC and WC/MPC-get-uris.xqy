xquery version "1.0-ml";
let $uris := (cts:uris((),(),cts:and-query((cts:collection-query('MasterPlannerConfig')))))
return (count($uris), $uris)