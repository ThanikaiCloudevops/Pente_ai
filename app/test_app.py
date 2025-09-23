import main

def test_get_parameter(monkeypatch):
    def mock_get_parameter(Name, WithDecryption):
        return {"Parameter": {"Value": "Test Message"}}
    monkeypatch.setattr(main.boto3.client("ssm"), "get_parameter", mock_get_parameter)

    result = main.get_parameter("dummy")
    assert result == "Test Message"
