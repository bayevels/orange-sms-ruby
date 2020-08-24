# frozen_string_literal: true

require 'test_helper'

module OrangeSms
  class ClientTest < Minitest::Test
    include WebMock::API

    def setup
      OrangeSms.setup do |config|
        config.sender_name = 'GiTHUB'
        config.sender_phone = '778909878'
        config.authorization = 'Basic NktSSHljksdj7P...Jjndb6UdnlrT2lOaA=='
        config.access_token = 'i6m2iIcY0SodWSe...L3ojAXXrH'
      end
    end

    def test_that_fetch_access_token_is_passing
      stub_request(:post, 'https://api.orange.com/oauth/v2/token')
        .to_return(body: '{
          "token_type": "Bearer",
          "access_token": "i6m2iIcY0SodWSe...L3ojAXXrH",
          "expires_in": "7776000"
        }', status: 200, headers: { 'Content-Type': 'application/json' })

      client = OrangeSms::Client.new
      assert_equal('i6m2iIcY0SodWSe...L3ojAXXrH', client.fetch_access_token)
    end

    def test_that_fetch_access_token_is_failing
      stub_request(:post, 'https://api.orange.com/oauth/v2/token')
        .to_return(body: '{
          "error": "invalid_client",
          "error_description": "The requested service needs credentials,..."
          }', status: 404, headers: { 'Content-Type': 'application/json' })

      client = OrangeSms::Client.new
      assert_raises(OrangeSms::Error::AuthenticationError) { client.fetch_access_token }
    end

    def test_that_send_sms_is_passing
      stub_request(:post, "https://api.orange.com/smsmessaging/v1/outbound/tel%3A%2B#{OrangeSms.sender_phone}/requests")
        .to_return(status: 201)
      client = OrangeSms::Client.new
      assert_nil(client.send_sms('786789098', 'test message'))
    end

    def test_that_send_sms_is_failing
      stub_request(:post, "https://api.orange.com/smsmessaging/v1/outbound/tel%3A%2B#{OrangeSms.sender_phone}/requests")
        .to_return(body: '{
          "code": 42,
          "message": "Expired credentials",
          "description": "The requested service needs credentials, and the ones provided were out-of-date."
        }', status: 401)
      client = OrangeSms::Client.new
      assert_raises(OrangeSms::Error::ApiError) { client.send_sms('786789098', 'test message') }
    end
  end
end
