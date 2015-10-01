class Api::V1::CacheService

  def initialize(serializer)
    @serializer = serializer
  end
  def cache(data)
    time_stamp = data.klass.order('updated_at DESC').limit(1).first.updated_at

    key = data.klass.to_s + time_stamp.to_i.to_s

    Rails.cache.fetch key do
      serialized(data)
    end
  end

  def serialized(data)
    @serializer.new(data)
  end
end
