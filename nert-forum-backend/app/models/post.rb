class Post < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  has_many :comments, :dependent => :destroy

  validates :title, :text_body, presence: true
end
