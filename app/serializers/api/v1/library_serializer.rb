class Api::V1::LibrarySerializer < ActiveModel::Serializer

  def initialize(object, options = {})
    super
    @service = Api::V1::DateService.new
  end

  attributes :id, :quality, :expiration_date, :content_id, :time_to_expire

  def time_to_expire
    @service.date_pretty_diff(Time.zone.now, object.expiration_date)
  end
end
