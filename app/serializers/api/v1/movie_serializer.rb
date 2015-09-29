class Api::V1::MovieSerializer < ActiveModel::Serializer
  attributes :id, :plot, :title, :year
end
