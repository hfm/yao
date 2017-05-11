module AuthStub
  def stub_auth_request(auth_url, username, password, tenant)
    stub_request(:post, "#{auth_url}/tokens")
      .with(
        body: auth_json(username, password, tenant)
      ).to_return(
        :status => 200,
        :body => response_json(auth_url, username, tenant),
        :headers => {'Content-Type' => 'application/json'}
      )
  end

  private

  def auth_json(username, password, tenant)
    json = <<-JSON
{"auth":{"passwordCredentials":{"username":"#{username}","password":"#{password}"},"tenantName":"#{tenant}"}}
    JSON

    json.strip
  end

  def response_json(auth_url, username, tenant)
    <<-JSON
{
  "access": {
    "token": {
      "issued_at": "#{Time.now.iso8601}",
      "expires": "#{(Time.now + 3600).utc.iso8601}",
      "id": "aaaa166533fd49f3b11b1cdce2430000",
      "tenant": {
        "description": "Testing",
        "enabled": true,
        "id": "aaaa166533fd49f3b11b1cdce2430000",
        "name": "#{tenant}"
      }
    },
    "serviceCatalog": [
      {
        "endpoints": [
          {
            "adminURL": "http://nova-endpoint.example.com:8774/v2/b598bf98671c47e1b955f8c9660e3c44",
            "region": "RegionOne",
            "internalURL": "http://nova-endpoint.example.com:8774/v2/b598bf98671c47e1b955f8c9660e3c44",
            "id": "1a66e6af97c440b2a7bbc4f9735923d9",
            "publicURL": "http://nova-endpoint.example.com:8774/v2/b598bf98671c47e1b955f8c9660e3c44"
          }
        ],
        "endpoints_links": [],
        "type": "compute",
        "name": "nova"
      },
      {
        "endpoints": [
          {
            "adminURL": "http://neutron-endpoint.example.com:9696/",
            "region": "RegionOne",
            "internalURL": "http://neutron-endpoint.example.com:9696/",
            "id": "0418104da877468ca65d739142fa3454",
            "publicURL": "http://neutron-endpoint.example.com:9696/"
          }
        ],
        "endpoints_links": [],
        "type": "network",
        "name": "neutron"
      },
      {
        "endpoints": [
          {
            "adminURL": "http://glance-endpoint.example.com:9292",
            "region": "RegionOne",
            "internalURL": "http://glance-endpoint.example.com:9292",
            "id": "246f33509ff64802b86eb081307ecec0",
            "publicURL": "http://glance-endpoint.example.com:9292"
          }
        ],
        "endpoints_links": [],
        "type": "image",
        "name": "glance"
      },
      {
        "endpoints": [
          {
            "adminURL": "#{auth_url}",
            "region": "RegionOne",
            "internalURL": "http://endpoint.example.com:5000/v2.0",
            "id": "2b982236cc084128bf42b647c1b7fb49",
            "publicURL": "http://endpoint.example.com:5000/v2.0"
          }
        ],
        "endpoints_links": [],
        "type": "identity",
        "name": "keystone"
      }
    ],
    "user": {
      "username": "#{username}",
      "roles_links": [],
      "id": "a9994b2dee82423da7da572397d3157a",
      "roles": [
        {
          "name": "admin"
        }
      ],
      "name": "#{username}"
    },
    "metadata": {
      "is_admin": 0,
      "roles": [
        "ce5330c512cc4bd289b3a725ad1106b7"
      ]
    }
  }
}
    JSON
  end
end
