require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  test 'associations' do
    assert slides(:one).language == languages(:one)
  end
end
