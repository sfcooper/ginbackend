require 'test_helper'

class GinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gin = gins(:one)
  end

  test "should get index" do
    get gins_url, as: :json
    assert_response :success
  end

  test "should create gin" do
    assert_difference('Gin.count') do
      post gins_url, params: { gin: { abv: @gin.abv, description: @gin.description, snippet: @gin.snippet, title: @gin.title } }, as: :json
    end

    assert_response 201
  end

  test "should show gin" do
    get gin_url(@gin), as: :json
    assert_response :success
  end

  test "should update gin" do
    patch gin_url(@gin), params: { gin: { abv: @gin.abv, description: @gin.description, snippet: @gin.snippet, title: @gin.title } }, as: :json
    assert_response 200
  end

  test "should destroy gin" do
    assert_difference('Gin.count', -1) do
      delete gin_url(@gin), as: :json
    end

    assert_response 204
  end
end
