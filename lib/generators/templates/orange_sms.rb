OrangeSms.setup do |config|
  # Sender Name
  # config.sender_name = 'GITHUB'
  config.sender_name = 'put your coporate name here'

  # Sender Phone
  config.sender_phone = 'put your phone number here'

  # Sender country code. Follow ISO-3166 alpha 3 country codes. Default country value is :sen (Senegal)
  # You can find supported countries by Orange Api in the folllowing link https://developer.orange.com/apis/sms-sn/getting-started
  # config.sender_country_code = :sen

  # SenderEmail
  config.sender_email = 'your-email@here.com'

  # Follow ISO-3166 alpha 3 country codes. Default country value is :sen (Senegal)
  # Use the country code of your receivers. You can find supported countries by Orange Api in the folllowing link https://developer.orange.com/apis/sms-sn/getting-started
  # config.default_receiver_country_code = :sen

  # Authorization Header you can find the Authorization header in your app dashboard https://developer.orange.com/myapps
  config.authorization = 'put your Authorization Header here !'

  # Generate the access token with the interactive console
  # --> client = OrangeSms::Client.new
  # --> client.fetch_access_token => 'CeppeLvEUgWK4o0r2WW2IzBrMQEn'
  config.access_token = 'put your access_token here !'
end
