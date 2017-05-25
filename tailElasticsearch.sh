#!/bin/bash

ELASTICSERCH_SERVER="http://172.30.121.210:9200"
INDEX="logstash-*"
SIZE=$1
TMP_FILE=/tmp/.$$.lessElastic
shift
QUERY=$(echo $@ |tr ' ' '+')

if [ $QUERY ]; then
	
	if [ $SIZE -gt 1000 ]; then exit; fi
	curl -s "${ELASTICSERCH_SERVER}/${INDEX}/_search?size=${SIZE}&fields=@message,@fields.instance&q=${QUERY}" > ${TMP_FILE}
	for linha in $(seq $SIZE); do
		instancia=$(cat ${TMP_FILE} |jq ".hits.hits[$linha -1].fields | {\"@fields.instance\"} | .[][]" |sed 's/"//g')
		log=$(cat ${TMP_FILE} |jq ".hits.hits[$linha - 1].fields | {\"@message\"} | .[][]"|sed 's/"//g')

		if [ "$log" ]; then
			tput setaf 2
			echo -n "${instancia} "
			tput sgr0
			echo -e $log
		fi
	done
fi

rm ${TMP_FILE}
