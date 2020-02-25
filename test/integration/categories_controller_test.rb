require 'test_helper'

class CreateCategoriesTest < ActopmDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
  end
end