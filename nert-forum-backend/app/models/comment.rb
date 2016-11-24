class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  alias_method :owner, :user

  validates :text_body, presence: true  
end
