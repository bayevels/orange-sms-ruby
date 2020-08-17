module OrangeSms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('./templates', __dir__)

      def copy_initializer_file
        template 'initializer.tt', 'config/initializers/active_admin.rb'
      end
    end
  end
end