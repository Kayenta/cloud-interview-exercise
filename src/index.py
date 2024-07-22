import boto3
import json


dynamodb = boto3.client('dynamodb')


def lambda_handler(event, context):
    print('Received event: ' + json.dumps(event))

    item = dynamodb.get_item(
        TableName='interview-exercise-currencies',
        Key={
            'code': {
                'S': event['code']
            }
        }
    )

    return {
        'name': item['Item']['name']['S'],
        'rate': item['Item']['rate']['N']
    }
