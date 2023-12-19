# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  test "should not save article without title" do 
  article = Article.new
  assert_not article.save, "Save the articel without a title"
  end 
  #   assert true
  # end

  test "should return five recent articles" do
    category = Category.create(name: "Technology")
    
    6.times do |i|
      Article.create(
        title: "Sample Article #{i}",
        content: "Content #{i}",
        category: category,
        created_at: i.days.ago
      )
    end

    recent_articles = Article.five_recent_articles

    assert_equal 5, recent_articles.count, "Did not return five recent articles"
    assert_equal "Sample Article 1", recent_articles.first.title, "Did not return the most recent article first"
  end
end

end
