require 'test_helper'

class FormHelperTest < ActionView::TestCase
  
  test 'a template was rendered' do
    concat(form_for(:user, :url => '/account', :html => { :id => 'my_form' }) do |f|
      f.text_field(:name)
    end)
    assert_template 'hi/there'
  end
end
