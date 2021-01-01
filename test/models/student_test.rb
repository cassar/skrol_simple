require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = students :one
  end

  test 'validations' do
    assert_raises ActiveRecord::RecordInvalid do
      assert Student.create! email: nil
    end
  end

  test 'associations' do
    assert @student.visits.include? visits :one
    assert @student.visited_slides.include? slides :one
  end
end
