# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :user 
  
  def user_comments
    comments
  end
  
end
