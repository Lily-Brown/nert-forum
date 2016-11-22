class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text_body, :owner, :created_at, :updated_at
end
