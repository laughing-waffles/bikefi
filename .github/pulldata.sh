curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Electric%20Bikes?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $0" > _data/ebikes.json
curl -X GET "https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Lenders?maxRecords=100&view=Grid%20view" \
 -H "Authorization: Bearer $0" > _data/financing.json

tail _data/financing.json

#Move this to jekyll.yaml using a get_json plugin to load the data files
#Actually 