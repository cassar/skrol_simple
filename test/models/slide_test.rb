require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  test 'associations' do
    assert slides(:one).language == languages(:one)
  end

  test 'validations' do
    assert_not Slide.new(target_script: slides(:one).target_script).save
    assert_not slides(:one).update target_script: nil
    assert_not slides(:one).update english_latin: nil
  end
end
