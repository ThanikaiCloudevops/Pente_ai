from flask import Flask
import boto3
import os

app = Flask(__name__)

def get_parameter(name):
    ssm = boto3.client("ssm", region_name=os.getenv("AWS_REGION", "us-east-1"))
    response = ssm.get_parameter(Name=name, WithDecryption=True)
    return response["Parameter"]["Value"]

@app.route("/")
def hello():
    param_name = os.getenv("SSM_PARAM", "/my-microservice/message")
    message = get_parameter(param_name)
    return {"message": f"Hello World! Config says: {message}"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
