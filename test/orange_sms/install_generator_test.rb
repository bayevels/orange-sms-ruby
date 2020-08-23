# frozen_string_literal: true

require 'test_helper'
require 'generators/install_generator'

module OrangeSms
  class InstallGeneratorTest < ::Rails::Generators::TestCase
    tests OrangeSms::Generators::InstallGenerator
    destination File.expand_path('../tmp', __dir__)
    setup :prepare_destination

    test 'generates orange_sms initializer' do
      run_generator
      assert_file 'config/initializers/orange_sms.rb'
    end
  end
end
