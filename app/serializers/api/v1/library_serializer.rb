class Api::V1::LibrarySerializer < ActiveModel::Serializer
  attributes :id, :quality, :expiration_date, :content_id
end
