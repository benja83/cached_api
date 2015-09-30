class Api::V1::PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :quality, :user_id, :content_id, :expiration_date
end
