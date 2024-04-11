xquery version "1.0-ml";

declare variable $count := 4;

xdmp:set-response-content-type("text/html; charset=utf-8"),
("Hello World!", $count, " tickets still available.")