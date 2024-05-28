xquery version "1.0-ml";

let $nav_path := 
  for $i in cts:search(collection("WidgetConfig"),())
  let $paths:= 
    if(exists($i/widgetconfig) and (data($i/widgetconfig/widgetType) eq "servicewidget") and exists($i/widgetconfig/serviceWidgetConfig) and (data($i/widgetconfig/serviceWidgetConfig/serviceName) eq "dataservice")) then
      (
      let $swc := $i/widgetconfig/serviceWidgetConfig       
      let $a := 
        if(exists($swc/buttonActions/buttonAction/navigationDetails)) then(
                $swc/buttonActions/buttonAction/navigationDetails[. ne ""]
             )
        else ()
      return $a
      )
    else 
      ()
    return $paths

let $var1:= <entry>
                 <key>userGroup</key>
                 <value xsi:type="xs:string" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"></value>
           </entry>
let $var2:= <entry>
                 <key>userGroup</key>
                 <value xsi:type="xs:string" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">IT Design Architect</value>
           </entry>
   
   
for $j in $nav_path
  return if($j/entry[key eq "widgetUniqueId"]/value eq "") then
           xdmp:node-insert-after($j/entry[key eq "widgetUniqueId"],$var1)
         else
           xdmp:node-insert-after($j/entry[key eq "widgetUniqueId"],$var2)