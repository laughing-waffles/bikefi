#! /bin/bash
echo "starting airtable import to json in _data folder"
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

echo "starting airtable import to markdown files"
rm -rf temp
rm -rf _posts/bike-shops/
curl -X GET "https://process.bikefi.net/airtabletomd.php" > temp.zip
unzip temp.zip
mkdir _posts/
mv temp/* _posts/
rm -rf temp
rm -rf temp.zip


echo "starting scraper import"
#curl -X GET "https://process.bikefi.net/pull.php" -o temp.zip
#ls
#unzip temp.zip
echo "$HSS" > ~/.ssh/id_rsa1
chmod 600 ~/.ssh/id_rsa1
mkdir _posts/products/
rsync -avzh -e 'ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa1' dh_d468jd@edpad.com:/home/dh_d468jd/process.bikefi.net/temp/ _posts/products/
#mv temp/* _posts/products/
ls _posts/products/
echo "moved files"
#rm -rf temp
#rm -rf temp.zip
