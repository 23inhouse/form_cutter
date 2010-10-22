module FormCutter
  module ActionViewExtensions
    module FormHelper
      different_methods = ['form_for', 'apply_form_for_options!', 'fields_for', 'label', 'check_box', 'radio_button']
      (ActionView::Helpers::FormHelper.instance_method_names - different_methods).each do |helper_method_name|
        module_eval <<-METHOD, __FILE__, __LINE__ + 1
          def #{helper_method_name}(object_name, method, options = {})
            begin
              raise template_error if !template?(options) || caller.first.include?("/app/views/"+base_template_path(options))
              render(:template => template_file(object_name, method, options, '#{helper_method_name}'), :locals => locals(object_name, method, '#{helper_method_name}', options))
            rescue ActionView::MissingTemplate
              super
            end
          end
        METHOD
      end
      
      def check_box(object_name, method, options = {}, checked_value = "1", unchecked_value = "0")
        begin
          raise template_error if !template?(options) || caller.first.include?("/app/views/"+base_template_path(options))
          render(:template => template_file(object_name, method, options, :check_box), :locals => locals(object_name, method, :check_box, options))
        rescue ActionView::MissingTemplate
          super
        end
      end
      
      def radio_button(object_name, method, tag_value, options = {})
        begin
          raise template_error if !template?(options) || caller.first.include?("/app/views/"+base_template_path(options))
          render(:template => template_file(object_name, method, options, :radio_button), :locals => locals(object_name, method, :radio_button, options))
        rescue ActionView::MissingTemplate
          super
        end
      end
      
    private
      
      def locals(object_name, method, helper_method_name, options, content = nil)
        options[:required] = options[:object].class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator if options[:required].nil?
        options[:required] = (options[:required] == true) ? I18n.t(:"form_cutter.required.mark", :default => '*') : ''
        
        locals = { :object => options[:object], :object_name => object_name, :method => method, :helper_method_name => helper_method_name, :options => options }
        locals.merge!({:hint => (options.delete(:hint) || '').html_safe})
        locals.merge!({:label_name => options.delete(:label)})
        locals.merge!({:report => options.delete(:report)})
        locals.merge!({:required => options.delete(:required)})
        locals.merge!({:template => options.delete(:template)})
        locals
      end
      
      def template_file(object_name, method, options, helper_method_name)
        resource = options[:object].class.to_s.pluralize.downcase
        template = options.delete(:template) || '..'
        
        template_path = ActionView::PathSet.new(Array.wrap('app/views'))
        details = {:locale => [:en, :en], :formats => [:html], :handlers => [:erb, :rjs, :builder, :rhtml, :rxml]}
        path = base_template_path(options)
        [
          [path, resource, template].join('/'),            # forms/blog/custom.html.erb
          [path, template].join('/'),                      # forms/custom.html.erb
          [path, template, method.to_s].join('/'),         # forms/custom/title.html.erb
          [path, template, helper_method_name].join('/'),  # forms/custom/text_field.html.erb
          [path, template, 'default'].join('/'),           # forms/custom/default.html.erb
          [path, resource, method.to_s].join('/'),         # forms/title.html.erb
          [path, resource, helper_method_name].join('/'),  # forms/blog/text_field.html.erb
          [path, helper_method_name].join('/'),            # forms/text_field.html.erb
          [path, 'default'].join('/')                      # forms/default.html.erb
        ].find { |template_file| template_path.exists?(template_file, '', false, details) } || '..'
      end
      
      def base_template_path(options)
        report?(options) ? FormCutter.reports_path : FormCutter.forms_path
      end
      
      def report?(options)
        options[:report]
      end
      
      def template?(options)
        !(options[:template] == false)
      end
      
      def template_error
        ActionView::MissingTemplate.new([], '1', '2', '3') # this will never be shown, it will be rescued by super
      end
    end
  end
end

ActionView::Base.send :include, FormCutter::ActionViewExtensions::FormHelper
