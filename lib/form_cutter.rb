require 'action_view'
require 'form_cutter/action_view_extensions/form_helper'
require 'form_cutter/action_view_extensions/builder'

module FormCutter
  # Default form and report template paths
  mattr_accessor :forms_path
  @@forms_path = 'forms'

  mattr_accessor :reports_path
  @@reports_path = 'reports'
  
  # Default way to setup FormCutter. Run rails generate form_cutter:install
  # to create a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
