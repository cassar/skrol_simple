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

  test 'get show' do
    get language_slide_path @language, @slide
    assert_response :success
  end

  test 'get show remote' do
    get language_slide_path @language, @slide, xhr: true
    assert_response :success
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
