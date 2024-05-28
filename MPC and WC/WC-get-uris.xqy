xquery version "1.0-ml";
let $uris := (cts:uris((),(),cts:and-query((cts:collection-query('WidgetConfig')))))
return (count($uris), $uris)