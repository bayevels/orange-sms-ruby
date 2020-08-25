# OrangeSms

> Orange Sms Ruby is a client library that allow you to send sms from a RoR app using the [Orange Sms API](https://developer.orange.com/apis/sms-sn/overview)

## Disclaimer
This gem is not an official client of Orange, in order to use the client you need to create a [Orange Sms API](https://developer.orange.com/apis/sms-sn/overview) and to register a app in the developer dashboard that orange provide to you. After registering your app you can ask for sms integration approval (this process can take time :)).
The registration process is detailed [here](https://developer.orange.com/apis/sms-sn/overview)
## Motivation
Instead of reading and trying to understand once again how the Orange Sms API work this gem aims to let you quickly send sms from a ruby  app (mainly RoR) using the [Orange Sms API](https://developer.orange.com/apis/sms-sn/overview).

```ruby
    # default receiver country is Senegal (:sen)
    client = OrangeSms::client.new
    client.send_sms('776879809', 'Simple comme bonjour !')
    # Or specify the country code when sending
    client = OrangeSms::client.new(:civ) # Ivory coast code
    client.send_sms('776879809', 'Simple comme bonjour !')
```
## Getting Started

### Setup
Add this line to your application's Gemfile:

```ruby
gem 'orange_sms'
```
Then run `bundle install`

Next, you need to run the generator:

```ruby
rails generate orange_sms:install
```
The generator will create an initializer file `/config/initializers/orange_sms.rb`.
You can setup, your app information there.
```ruby
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
```
### Generate Access token
Get the Authorization header from your Orange developer dashboard
```ruby
config.authorization = 'Basic NktSSHljksdj7P...Jjndb6UdnlrT2lOaA==' 
```
You can get your access token using the rails console
```ruby
    client = OrangeSms::Client.new
    client.fetch_access_token ==> i6m2iIcY0SodWSe...L3ojAXXrH
```
Copy it and paste it into your initializer file, and add it to the initializer file `/config/initializers/orange_sms.rb`
```ruby
config.access_token = 'i6m2iIcY0SodWSe...L3ojAXXrH' # You may use ENV variables
```
The access token will last 7776000 seconds, i.e. 90 days. After this period, you'll get an error and should request another token.

### Send Sms
```ruby
    # default receiver country is Senegal (:sen)
    client = OrangeSms::client.new
    client.send_sms('776879809', 'Simple comme bonjour !')
    # Or specify the country code when sending
    client = OrangeSms::client.new(:civ) # Ivory coast code
    client.send_sms('776879809', 'Simple comme bonjour !')
```
### Handling Errors
```ruby
    begin
      client.send_sms('776879809', 'Simple comme bonjour !')
    rescue OrangeSms::Error::ApiError => e
      puts e.message
    end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bayevels/orange_sms.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
