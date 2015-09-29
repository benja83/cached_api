class Api::V1::ContentSerializer < ActiveModel::Serializer
  attributes :id, :plot, :title, :year, :type
end
