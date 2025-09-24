import main

def test_get_parameter(monkeypatch):
    class MockSSMClient:
        def get_parameter(self, Name, WithDecryption):
            return {"Parameter": {"Value": "Test Message"}}

    def mock_boto3_client(service_name, region_name=None):
        if service_name == "ssm":
            return MockSSMClient()
        raise Exception(f"Unexpected service_name {service_name}")

    # Patch boto3.client globally
    monkeypatch.setattr("boto3.client", mock_boto3_client)

    # Call the function with a dummy param name
    result = main.get_parameter("dummy-param")

    assert result == "Test Message"
