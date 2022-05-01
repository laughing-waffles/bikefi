#! /bin/bash

curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Electric%20Bikes?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $1" > _data/ebikes.json
curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Lenders?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $1" > _data/financing.json
curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Discounts?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $1" > _data/discounts.json
curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Locations?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $1" > _data/locations.json
curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Dealers?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $1" > _data/dealers.json


if [ $2 = "staging" ]
then
	echo "\033[0;31mStaging environment!\033[0m"
	echo "User-agent: * Disallow: /" > robots.txt
	FAST=10
fi


rm -rf temp
rm -rf _posts/bikes/
rm -rf _posts/bike-shops/
curl -X GET "https://objectif.app/ebike/generatemd.php?type=$2" > temp.zip
unzip temp.zip
mkdir _posts/
mv temp/* _posts/
rm -rf temp
rm -rf temp.zip

curl -X GET "http://process.bikefi.net/generate.php?json=output/data/inventory.jl&filename=title&title=title&content=description&date=updated_at&fast=$FAST" > temp.zip
unzip temp.zip
mv temp/* _posts/products/
rm -rf temp
rm -rf temp.zip
