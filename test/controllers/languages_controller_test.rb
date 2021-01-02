require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language = languages :one
  end

  test 'get root' do
    get root_path
    assert_response :success
  end

  test 'get new' do
    get new_language_path
    assert_response :success
  end

  test 'post create success' do
    assert_difference 'Language.count', 1 do
      post languages_path, params: {
        language: {
          name: 'Testish',
          iso_639_1: 'ts'
        }
      }
    end
    assert_redirected_to language_slides_path(Language.last)
  end

  test 'post create fail' do
    assert_no_difference 'Language.count', 'A Language should not be created' do
      post languages_path, params: {
        language: {
          name: Language.first.name,
          iso_639_1: 'ts'
        }
      }
    end
    assert_response :success
  end

  test 'get edit' do
    get edit_language_path(@language)
    assert_response :success
  end

  test 'patch update success' do
    patch language_path @language, params: {
      language: {
        name: 'testish'
      }
    }
    assert_redirected_to language_slides_path(@language.reload)
  end

  test 'patch update fail' do
    patch language_path @language, params: {
      language: {
        name: Language.second.name
      }
    }
    assert_response :success
  end
end
