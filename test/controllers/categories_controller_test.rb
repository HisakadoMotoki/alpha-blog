require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "motoki", email: "saga@gmail.com", password: "passward", admin: true)
  end
  test "should get categories index" do
    get :index
    expect(response).to be_success
  end
  test "should get new" do
    sign_in_as(@user, "password")
    get :new
    expect(response).to be_success
  end
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: { name: "sports"}}
    end
    assert_redirected_to categories_path
  end
end