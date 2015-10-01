class Api::V1::CacheService
  def render_cached(data, serializer)
    key = data.klass.to_s + DateTime.now.to_s

    serialized_data = serializer.new(data)
    puts serialized_data

    Rails.cache.fetch key do
      return Proc.new { render json: serialized_data }
    end
  end
end
