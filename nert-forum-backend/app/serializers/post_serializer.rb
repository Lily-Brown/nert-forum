class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text_body, :created_at, :updated_at
end
