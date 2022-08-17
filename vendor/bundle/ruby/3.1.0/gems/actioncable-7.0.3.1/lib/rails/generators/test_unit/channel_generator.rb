module TestUnit
  module Generators
    class ChannelGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      check_class_collision suffix: 'ChannelTest'

      def create_test_files
        template 'channel_test.rb', File.join('test/channels', class_path, "#{file_name}_channel_test.rb")
      end

      private

      # :doc:
      def file_name
        @_file_name ||= super.sub(/_channel\z/i, '')
      end
    end
  end
end
