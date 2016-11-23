class Session
  include ActiveModel::Model
  include ActiveModel::Serialization
  attr_accessor :id, :auth_key, :user
end
