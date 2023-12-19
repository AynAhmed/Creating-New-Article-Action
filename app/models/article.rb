# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  belongs_to :category

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true

  def self.five_recent_articles
    order(created_at: :desc).limit(5)
  end

end
