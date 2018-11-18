class UserWithTokenSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :token
end
