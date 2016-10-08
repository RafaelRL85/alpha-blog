require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sporti")
    @category = Category.create(name: "programming")

    test "shoudl show cat listing" do
      get categories_path
      assert_template "categories/index"
      assert_select "a[href=?]", category_path(@category), test: @category.name
    end

  end
end