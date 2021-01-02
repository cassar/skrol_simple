require 'test_helper'

class SlidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slide = slides :one
    @language = languages :one
  end

  test 'get index' do
    get language_slides_path @language
    assert_response :success
  end

  test 'get show no user' do
    assert_no_difference 'Visit.count' do
      get language_slide_path @language, @slide
    end
    assert_response :success
  end

  test 'get show with user' do
    sign_in_as_student 'skrol@example.com'
    assert_difference 'Visit.count', 1 do
      get language_slide_path @language, @slide
    end
    assert_response :success
  end

  test 'get show last' do
    get language_slide_path @language, @language.slides.last
    assert_response :success
  end

  test 'get next last visit' do
    sign_in_as_student 'skrol@example.com'
    get current_language_slides_path @language
    assert_redirected_to language_slide_path @language, slides(:two)
  end

  test 'get next no visits' do
    sign_in_as_student 'skrol@example.com'
    Visit.destroy_all
    get current_language_slides_path @language
    assert_redirected_to language_slide_path @language, @slide
  end

  test 'get next no slides' do
    other_language = languages :two
    get current_language_slides_path other_language
    assert_redirected_to language_slides_path other_language
  end

  test 'get new' do
    get new_language_slide_path @language
    assert_response :success
  end

  test 'post create' do
    assert_difference 'Slide.count', 1 do
      post language_slides_path(@language), params: {
        slide: {
          english_latin: 'hello',
          target_script: 'hello',
          target_ipa: 'ewa'
        }
      }
    end
    assert_redirected_to new_language_slide_path @language
  end

  test 'get edit' do
    get edit_language_slide_path @language, @slide
    assert_response :success
  end

  test 'patch update' do
    patch language_slide_path @language, @slide, params: {
      slide: {
        english_latin: 'updated'
      }
    }
    assert_redirected_to language_slide_path @language, @slide
    @slide.reload
    assert @slide.english_latin == 'updated'
  end
end
