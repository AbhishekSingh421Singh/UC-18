import json
import boto3
from PIL import Image
import os

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        download_path = f'/tmp/{key}'
        upload_path =key}'

        s3.download_file(bucket, key, download_path)

        with Image.open(download_path) as img:
            img = img.convert("L")  # Convert to grayscale
            img.save(upload_path)

        s3.upload_file(upload_path, os.environ['PROCESSED_BUCKET'], f'processed-{key}')

    return {
        'statusCode': 200,
        'body': json.dumps('Image processed successfully')
    }