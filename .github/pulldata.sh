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


rm -rf temp
rm -rf _posts/bikes/
rm -rf _posts/bike-shops/
curl -X GET "https://objectif.app/ebike/generatemd.php" > temp.zip
unzip temp.zip
mkdir _posts/
mv temp/* _posts/
rm -rf temp
rm -rf temp.zip