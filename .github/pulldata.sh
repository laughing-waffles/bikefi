#curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Electric%20Bikes?maxRecords=100&view=Grid%20view" \
 #-H "Authorization: Bearer $1" > _data/ebikes.json
#curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Lenders?maxRecords=100&view=Grid%20view" \
 #-H "Authorization: Bearer $1" > _data/financing.json

rm -rf temp
rm -rf _ebikes/
curl -X GET "https://objectif.app/ebike/generatemd.php" > temp.zip
unzip temp.zip
mv temp/* _ebikes/
rm -rf temp
rm -rf temp.zip