module FormCutter
  module ActionViewExtensions
    module Builder
      def self.included(base)
        base.send(:alias_method, :objectify_options_original, :objectify_options)
        base.send(:remove_method, :objectify_options)
      end
      
    private
      def objectify_options(options)
        extended_options = {}
        extended_options.merge!(:report => @options[:report]) unless @options[:report].nil?
        extended_options.merge!(:template => @options[:template]) unless @options[:template].nil?
        extended_options.merge!(options)
        objectify_options_original(extended_options)
      end
    end
  end
end

ActionView::Helpers::FormBuilder.send :include, FormCutter::ActionViewExtensions::Builder
