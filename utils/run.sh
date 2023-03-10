#!/bin/bash
export files=(/nbia/manifest/*)
manifest_file=${files[0]}
echo "$manifest_file is used for downloading the dataset"   

yes | /opt/nbia-data-retriever/nbia-data-retriever --cli ${files[0]} -d /nbia/data
