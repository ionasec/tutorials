
const kendra = require('aws-sdk/clients/kendra');
const kendraClient = new kendra({apiVersion: '2019-02-03', region: 'eu-west-1'});
const NUMBER_VALUE = 100;

var query='What is Amazon DynamoDB?'
var index_id='880c47e9-8b39-4d16-abd0-0acb628110fd'

var params = {
  IndexId: index_id, /* required */
  MaxResults: NUMBER_VALUE,
//  NextToken: 'STRING_VALUE'
};

kendraClient.listFaqs(params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     
      console.log(data);           // successful response
});