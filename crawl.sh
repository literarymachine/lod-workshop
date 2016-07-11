#!/bin/bash

rapper -i turtle -o rdfxml-abbrev $1 | curl -H "Content-type: application/rdf+xml" -i "http://fuseki.lobid.org/lodws/data" -d @-
for uri in `rapper -i turtle $1 | grep -e "interest" | cut -d ' ' -f3 | sort | uniq | sed 's/^<\(.*\)>$/\1/'`
	do rapper -o rdfxml-abbrev $uri | curl -H "Content-type: application/rdf+xml" -i "http://fuseki.lobid.org/lodws/data" -d @-
done
