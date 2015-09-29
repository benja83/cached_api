class Api::V1::EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :plot, :title, :number
end
