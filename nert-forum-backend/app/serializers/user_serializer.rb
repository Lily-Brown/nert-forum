class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :neighborhood, :image
end
