class SessionSerializer < ActiveModel::Serializer
  attributes :auth_key
  belongs_to :user
end
