require 'test_helper'

class SlidesControllerTest < ActionDispatch::IntegrationTest
  test 'get index' do
    get root_path
    assert_response :success
  end

  test 'get show' do
    get slide_path slides(:one)
    assert_response :success
  end

  test 'get new' do
    get new_slide_path
    assert_response :success
  end

  test 'post create' do
    assert_difference 'Slide.count', 1 do
      post slides_path, params: {
        slide: {
          english_latin: 'hello',
          maltese_ipa: 'hello',
          maltese_latin: 'ewa'
        }
      }
    end
    assert_redirected_to new_slide_path
  end

  test 'get edit' do
    get edit_slide_path slides(:one)
    assert_response :success
  end

  test 'patch update' do
    patch slide_path slides(:one), params: {
      slide: {
        english_latin: 'updated'
      }
    }
    assert_redirected_to slide_path(slides(:one))
    slides(:one).reload
    assert slides(:one).english_latin == 'updated'
  end
end
