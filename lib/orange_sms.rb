# frozen_string_literal: true

require 'orange_sms/version'
require 'orange_sms/client'
require 'orange_sms/error'
require 'active_support/core_ext/module/attribute_accessors'

module OrangeSms
  mattr_accessor :sender_name
  @@sender_name = nil

  mattr_accessor :sender_phone
  @@sender_phone = nil

  mattr_accessor :sender_country_code
  @@sender_country_code = :sen

  mattr_accessor :authorization
  @@authorization = nil

  mattr_accessor :default_receiver_country_code
  @@default_receiver_country_code = :sen

  mattr_accessor :access_token
  @@access_token = nil

  mattr_reader :base_url
  @@base_url = 'https://api.orange.com'

  # Setup the Gem
  def self.setup
    yield self
  end
end
