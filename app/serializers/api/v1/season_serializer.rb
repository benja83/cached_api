class Api::V1::SeasonSerializer < ActiveModel::Serializer
  attributes :id, :plot, :title, :year, :episodes

  has_many :episodes

end
