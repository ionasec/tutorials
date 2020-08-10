#test kendra query

import boto3
import pprint

kendra = boto3.client('kendra',region_name='eu-west-1')


query='What is Amazon DynamoDB?'
index_id='880c47e9-8b39-4d16-abd0-0acb628110fd'

response=kendra.query(
        QueryText = query,
        IndexId = index_id)

print ('\nSearch results for query: ' + query + '\n')        

for query_result in response['ResultItems']:

    print('-------------------')
    print('Type: ' + str(query_result['Type']))
        
    if query_result['Type']=='ANSWER':
        answer_text = query_result['DocumentExcerpt']['Text']
        print(answer_text)

    if query_result['Type']=='DOCUMENT':
        if 'DocumentTitle' in query_result:
            document_title = query_result['DocumentTitle']['Text']
            print('Title: ' + document_title)
        document_text = query_result['DocumentExcerpt']['Text']
        print(document_text)

    print ('------------------\n\n')  
    