require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get about" do
    get page_about_url
    assert_response :success
  end

  test "name should be unique" do
  @category.save
  category2 = Category.new(name: "sports")
  assert_not category2.valid?
  end

end
