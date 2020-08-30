# frozen_string_literal: true

require 'rails/generators/base'

module OrangeSms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('./templates', __dir__)

      def copy_initializer
        copy_file 'orange_sms.rb', 'config/initializers/orange_sms.rb'
      end
    end
  end
end