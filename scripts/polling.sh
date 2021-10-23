#!/bin/bash

declare -i duration=1
declare hasUrl=""
declare endpoint
declare count=0
declare maxCount=120

usage() {
    cat <<END
    polling.sh [-i] [-h] endpoint
    
    Report the health status of the endpoint
    -i: include Uri for the format
    -h: help
END
}

while getopts "ih" opt; do 
  case $opt in 
    i)
      hasUrl=true
      ;;
    h) 
      usage
      exit 0
      ;;
    \?)
     echo "Unknown option: -${OPTARG}" >&2
     exit 1
     ;;
  esac
done

shift $((OPTIND -1))

if [[ $1 ]]; then
  endpoint=$1
else
  echo "Please specify the endpoint."
  usage
  exit 1 
fi 


healthcheck() {
    declare url=$1
    result=$(curl --http2 -i $url 2>/dev/null | grep HTTP/2)
    echo $result
}

while [[ true ]]; do
  result=`healthcheck $endpoint` 
  declare status
  if [[ -z $result ]]; then 
    status="N/A"
  else
    status=${result:7:3}
  fi 

  if [[ $status -eq '200' ]]; then
    echo "SERVER HEALTHY"
    exit 0
  fi
   
  let "count++"

  if [[ $count -ge $maxCount ]]; then
    echo "NO MORE TRIES HOCHACHO"
    exit 1
  fi

  sleep $duration
done