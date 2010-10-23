# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{form_cutter}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benjamin Lewis"]
  s.date = %q{2010-10-22}
  s.description = %q{Lets you wrap your form helper methods is custom html}
  s.email = %q{23inhouse@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "init.rb",
     "lib/form_cutter.rb",
     "lib/form_cutter/action_view_extensions/builder.rb",
     "lib/form_cutter/action_view_extensions/form_helper.rb",
     "lib/form_cutter/version.rb",
     "lib/generators/form_cutter/USAGE",
     "lib/generators/form_cutter/install_generator.rb",
     "lib/generators/form_cutter/templates/_form.html.erb",
     "lib/generators/form_cutter/templates/default.html.erb",
     "lib/generators/form_cutter/templates/en.yml",
     "lib/generators/form_cutter/templates/form_cutter.rb"
  ]
  s.homepage = %q{http://github.com/23inhouse/form_cutter}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Forms made templatable!}
  s.test_files = [
    "test/action_view_extensions/form_helper_test.rb",
     "test/form_cutter_test.rb",
     "test/support/misc_helpers.rb",
     "test/support/mock_controller.rb",
     "test/support/mock_response.rb",
     "test/support/models.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

