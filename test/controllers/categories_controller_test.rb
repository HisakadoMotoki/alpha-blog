require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end
  test "should get categories index" do
    get :index
    expect(response).to be_success
  end
    test "should get new" do
    get :new
    expect(response).to be_success
  end
    test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

end