class Api::V1::PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :quality, :expiration_date, :content_id
end
