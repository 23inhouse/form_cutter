module FormCutter
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy FormCutter default files"
      source_root File.expand_path('../templates', __FILE__)
      class_option :template_engine

      def copy_initializers
        copy_file 'form_cutter.rb', 'config/initializers/form_cutter.rb'
      end

      def copy_templates
        copy_file 'default.html.erb', 'app/views/forms/default.html.erb'
      end

      def copy_locale_file
        copy_file 'en.yml', 'config/locales/form_cutter.en.yml'
      end

      def copy_scaffold_template
        engine = options[:template_engine]
        copy_file "_form.html.#{engine}", "lib/templates/#{engine}/scaffold/_form.html.#{engine}"
      end
    end
  end
end
