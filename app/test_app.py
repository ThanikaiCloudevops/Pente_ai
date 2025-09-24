import main
from unittest.mock import Mock

def test_get_parameter(monkeypatch):
    # Create a mock SSM client
    mock_ssm_client = Mock()
    mock_ssm_client.get_parameter.return_value = {"Parameter": {"Value": "Test Message"}}

    # Patch boto3.client to return the mock client when called with 'ssm'
    def mock_boto3_client(service_name):
        if service_name == "ssm":
            return mock_ssm_client
        else:
            raise Exception(f"Unexpected service_name {service_name}")

    monkeypatch.setattr("boto3.client", mock_boto3_client)

    # Now call the function that uses boto3.client('ssm')
    result = main.get_parameter_value()

    assert result == "Test Message"
