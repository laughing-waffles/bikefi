<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

//$tables = array(array("name"=>"Electric%20Bikes","folder"=>"ebikes"),array("name"=>"Discounts","folder"=>"ediscount"),array("name"=>"Electric%20Bikes","folder"=>"ebikes"),array("name"=>"Electric%20Bikes","folder"=>"ebikes"));


//ebike data
$json_url = 'https://api.airtable.com/v0/appQDiGy9oyBWoqcC/Electric%20Bikes?maxRecords=100&view=Grid%20view';
// Initializing curl
$ch = curl_init( $json_url );
// Configuring curl options
$options = array(
CURLOPT_RETURNTRANSFER => true,
CURLOPT_HTTPHEADER => array('Content-type: application/json', 'Authorization: Bearer {{KEY}}') 

);
// Setting curl options
curl_setopt_array( $ch, $options );
// Getting results
$result = json_decode(curl_exec($ch), TRUE);
if (!is_dir('temp/_ebikes/'))
{
mkdir ('temp/_ebikes/');
}
foreach ($result['records'] as $entry) {
  $txt = '---' . PHP_EOL . 'layout: shop-single' . PHP_EOL . 'title: ' . $entry['fields']['ModelName'] . PHP_EOL;
  foreach ($entry['fields'] as $key=>$value) {
    if (!is_array($value)) {
      $txt .= strtolower($key) . ': ' . $value . PHP_EOL;
    }
  }
  
  $txt .= PHP_EOL . '---';
  
  $myfile = fopen("temp/_ebikes/" . strtolower($entry['fields']['Manufacturer'] . '-' . $entry['fields']['ModelName']) . '.md', "w"); 
  fwrite($myfile, $txt);
  fclose($myfile);
  
}
$txt = '---' . PHP_EOL . 'layout: collectionlist' . PHP_EOL . 'title: ebikes' . PHP_EOL . PHP_EOL . 'permalink: ebikes/index.html' . PHP_EOL . '---';
$myfile = fopen("temp/_ebikes/index.md", "w"); 
fwrite($myfile, $txt);
fclose($myfile);

shell_exec("zip -r temp/temp.zip temp/");

header("Content-Type: application/zip");
header('Content-Disposition: attachment; filename="temp.zip"');

readfile("temp/temp.zip");
shell_exec("rm -rf temp/*");

?>