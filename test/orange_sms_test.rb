require "test_helper"

class OrangeSmsTest < Minitest::Test
  def setup
    OrangeSms.setup do |config|
      config.sender_name = 'someSenderName'
      config.sender_phone = 'someSenderPhone'
      config.authorization = 'someAuthorization'
      config.access_token = 'someAccessToken'
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::OrangeSms::VERSION
  end

  def test_that_configuration_is_setup
    assert_equal('someSenderName', OrangeSms.sender_name)
    assert_equal('someSenderPhone', OrangeSms.sender_phone)
    assert_equal(:sen, OrangeSms.sender_country_code)
    assert_equal(:sen, OrangeSms.default_receiver_country_code)
    assert_equal('someAuthorization', OrangeSms.authorization)
    assert_equal('someAccessToken', OrangeSms.access_token)
    assert_equal('https://api.orange.com', OrangeSms.base_url)
  end
end
