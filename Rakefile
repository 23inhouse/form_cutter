# encoding: UTF-8
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'form_cutter', 'version')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the form_cutter plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the form_cutter plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'FormCutter'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "form_cutter"
    s.version = FormCutter::VERSION.dup
    s.summary = "Forms made templatable!"
    s.email = "23inhouse@gmail.com"
    s.homepage = "http://github.com/23inhouse/form_cutter"
    s.description = "Lets you wrap your form helper methods in custom html"
    s.authors = ['Benjamin Lewis']
    s.files =  FileList["[A-Z]*(.rdoc)", "{generators,lib}/**/*", "init.rb"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install jeweler"
end
