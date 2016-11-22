class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text_body
  belongs_to :user
  belongs_to :post
end
