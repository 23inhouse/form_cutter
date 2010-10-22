require 'test_helper'

class FormCutterTest < ActiveSupport::TestCase
  test 'setup block yields self' do
    FormCutter.setup do |config|
      assert_equal FormCutter, config
    end
  end
end
