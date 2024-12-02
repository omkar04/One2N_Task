from flask import Flask, jsonify
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError ,ClientError
import logging

import os
print(os.environ.get('AWS_ACCESS_KEY_ID'))

boto3.set_stream_logger(name='botocore', level=logging.DEBUG)

app = Flask(__name__)

AWS_REGION = 'us-east-1'
S3_BUCKET = 'testbucket9207'

s3_client = boto3.client('s3', region_name=AWS_REGION)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the S3 Bucket Content Service!"})

@app.route('/favicon.ico')
def favicon():
    return '', 204  # No Content response

@app.route('/list-bucket-content/', defaults={'path': ''})
@app.route('/list-bucket-content/<path:path>')
def list_bucket_content(path):
    try:
        prefix = path.strip('/') + '/' if path else ''
        response = s3_client.list_objects_v2(Bucket=S3_BUCKET, Prefix=prefix, Delimiter='/')

        if response.get('KeyCount', 0) == 0:
            return jsonify({"error": "Path not found"}), 404

        directories = [p['Prefix'].rstrip('/').split('/')[-1] for p in response.get('CommonPrefixes', [])]
        files = [o['Key'].split('/')[-1] for o in response.get('Contents', []) if o['Key'] != prefix]

        return jsonify({"content": directories + files})

    except ClientError as e:
        return jsonify({"error": str(e)}), 500
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000 ,  debug=True)
    
