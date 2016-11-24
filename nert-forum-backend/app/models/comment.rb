class Comment < ApplicationRecord
  belongs_to :post, :dependent => :delete
  belongs_to :user, :dependent => :delete
  alias_method :owner, :user

  validates :text_body, presence: true  
end
