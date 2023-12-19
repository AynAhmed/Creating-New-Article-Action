require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return comments made by the user" do
    user = User.create(username: "testuser")
    article = Article.create(title: "Sample Article", content: "Content")
    
    user.comments.create(content: "Comment 1", article: article)
    user.comments.create(content: "Comment 2", article: article)
    article.comments.create(content: "Comment 3", user: user)

    user_comments = user.user_comments

    assert_equal 3, user_comments.count, "Did not return the correct number of comments made by the user"
  end
end
