class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text_body
end
