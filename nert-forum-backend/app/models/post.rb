class Post < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  validates :title, :text_body, presence: true
end
