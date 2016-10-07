require 'test_helper'

class SharersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sharer = sharers(:one)
  end

  test "should get index" do
    get sharers_url
    assert_response :success
  end

  test "should get new" do
    get new_sharer_url
    assert_response :success
  end

  test "should create sharer" do
    assert_difference('Sharer.count') do
      post sharers_url, params: { sharer: { city: @sharer.city, email: @sharer.email, name: @sharer.name } }
    end

    assert_redirected_to sharer_url(Sharer.last)
  end

  test "should show sharer" do
    get sharer_url(@sharer)
    assert_response :success
  end

  test "should get edit" do
    get edit_sharer_url(@sharer)
    assert_response :success
  end

  test "should update sharer" do
    patch sharer_url(@sharer), params: { sharer: { city: @sharer.city, email: @sharer.email, name: @sharer.name } }
    assert_redirected_to sharer_url(@sharer)
  end

  test "should destroy sharer" do
    assert_difference('Sharer.count', -1) do
      delete sharer_url(@sharer)
    end

    assert_redirected_to sharers_url
  end
end
