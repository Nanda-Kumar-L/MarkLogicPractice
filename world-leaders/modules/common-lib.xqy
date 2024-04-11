xquery version "1.0-ml";
module namespace co = "http://marklogic.com/mlu/world-leaders/common";

declare namespace wl = "http://marklogic.com/mlu/world-leaders";

declare function in-office() as xs:string
{
 let $inseq := for $present in /wl:leader/wl:positions/
 wl:position[1]/wl:enddate/text()[. = "present"]
 return $present
 let $incount := fn:count($inseq)
 return fn:concat(" (in office: ", $incount, ")")
};