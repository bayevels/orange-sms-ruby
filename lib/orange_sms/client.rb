require 'faraday'

module OrangeSms
  # Orange Api Client used to send http request to the Orange Backend
  class Client
    attr_reader :country_code, :country, :sender_phone

    SUPPORTED_COUNTRIES = {
      sen: { country: 'Senegal', code: 'SEN', prefix: 'tel:+221' },
      mli: { country: 'Mali', code: 'MLI', prefix: 'tel:+223' },
      bwa: { country: 'Botswana', code: 'BWA', prefix: 'tel:+267' },
      bfa: { country: 'Burkina Faso', code: 'BFA', prefix: 'tel:+226' },
      cod: { country: 'DR Congo', code: 'COD', prefix: 'tel:+243' },
      civ: { country: "Côte d'Ivoire / Ivory Coast", code: 'CIV', prefix: 'tel:+225' },
      egy: { country: 'Egypt', code: 'EGY', prefix: 'tel:+200' },
      jor: { country: 'Jordan', code: 'JOR', prefix: 'tel:+962' },
      gin: { country: 'Guinea Conakry', code: 'GIN', prefix: 'tel:+224' },
      ner: { country: 'Niger', code: 'NER', prefix: 'tel:+227' },
      tun: { country: 'Tunisia', code: 'TUN', prefix: 'tel:+216' },
      cmr: { country: 'Cameroon', code: 'CMR', prefix: 'tel:+237' }
    }.freeze

    def initialize(country_code = nil)
      @country_code = country_code.nil? ? OrangeSms.default_receiver_country_code : country_code
      @country = SUPPORTED_COUNTRIES[@country_code]
      @sender_country = SUPPORTED_COUNTRIES[OrangeSms.sender_country_code]
      @sender_phone = @sender_country[:prefix] + OrangeSms.sender_phone
    end

    # Fetch the access token directly from your code
    def fetch_access_token
      response = send_request('/oauth/v3/token',
                              'grant_type=client_credentials',
                              OrangeSms.authorization,
                              'application/x-www-form-urlencoded')
      raise OrangeSms::Error::AuthenticationError.new('Unable to fetch access token', response) if response.status != 200

      JSON.parse(response.body).fetch('access_token', nil)
    end

    # Ask Orange backend to send test message to the sender_phone defined in the /config/initializer/orange_sms.rb
    def send_test_sms
      send_sms(OrangeSms.sender_phone, "Yes ! it's working")
    end

    # Ask Orange backend to send Sms to some number
    def send_sms(receiver_phone, message)
      response = send_request("/smsmessaging/v1/outbound/#{sender_phone}/requests",
                              build_sms_payload(receiver_phone, message),
                              "Bearer #{fetch_access_token}", 'application/json')
      raise OrangeSms::Error::ApiError.new('Unable to Send message', response) if response.status != 201
    end

    private

    # Send a request
    def send_request(partial_url, payload, authorization_header, content_type)
      Faraday.post(OrangeSms.base_url + partial_url,
                   payload,
                   { 'Authorization' => authorization_header, 'Content-type' => content_type })
    end

    # Build the payload that gonna be sended
    def build_sms_payload(receiver_phone, message)
      {
        outboundSMSMessageRequest: {
          address: country[:prefix] + receiver_phone,
          senderName: OrangeSms.sender_name,
          senderAddress: sender_phone,
          outboundSMSTextMessage: {
            message: message
          }
        }
      }.to_json
    end
  end
end
