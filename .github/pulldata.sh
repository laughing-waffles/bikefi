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


if [$2 == 'staging']
then
	cat <<EOF >robots.txt
	User-agent: * Disallow: /
	EOF
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

curl -X GET "http://process.bikefi.net/generate.php?json=output/data/inventory.jl&filename=name&title=title&content=description&date=last_modified&fast=$FAST" > temp.zip
unzip temp.zip
mv temp/* _posts/products/
rm -rf temp
rm -rf temp.zip



