module Maclease
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Maclease initializer for your application"

      def copy_initializer
        template "maclease_initializer.rb", "config/initializers/maclease.rb"

        puts "Remember to set the base url in your environment files under the maclease_url key"
      end
    end
  end
end
