class Category < ApplicationRecord
    has_many :articles, dependent: :destroy

    validates :name, presence: true, uniqueness: true 

    # Added a new description attribute
    validates :description, presence: { allow_blank: true }
    def article_count
      articles.count
    end
  end

