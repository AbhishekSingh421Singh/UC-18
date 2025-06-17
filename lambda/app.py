import boto3
import os
import tempfile
from PIL import Image

s3 = boto3.client('s3')

def handler(event, context):
    # Extract bucket and object key from event
    record = event['Records'][0]
    source_bucket = record['s3']['bucket']['name']
    object_key = record['s3']['object']['key']
    
    # Define destination bucket
    destination_bucket = os.environ['PROCESSED_BUCKET']

    # Download image to temp file
    with tempfile.NamedTemporaryFile() as tmp_file:
        s3.download_file(source_bucket, object_key, tmp_file.name)
        
        # Open and process image
        with Image.open(tmp_file.name) as img:
            img = img.resize((512, 512))  # Resize example

            # Save processed image
            processed_path = tmp_file.name + "_processed.jpg"
            img.save(processed_path)

            # Upload to destination bucket
            s3.upload_file(processed_path, destination_bucket, f"processed/{object_key}")
    
    return {
        'statusCode': 200,
        'body': f"Image {object_key} processed and uploaded to {destination_bucket}"
    }