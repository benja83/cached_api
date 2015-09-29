class Api::V1::ContentSerializer < ActiveModel::Serializer
  attributes :id, :plot, :title, :year, :type

  # def created_at
  #   object.created_at.in_time_zone.iso8601 if object.created_at
  # end

  # def updated_at
  #   object.updated_at.in_time_zone.iso8601 if object.created_at
  # end
end
