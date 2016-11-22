class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text_body, presence: true
end
