require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return total articles for a category" do
    category = Category.create(name: "Technology")

    3.times do |i|
      category.articles.create(
        title: "Sample Article #{i}",
        content: "Content #{i}"
      )
    end

    total = category.total_articles

    assert_equal 3, total, "Did not return the correct total number of articles for the category"
  end
end
