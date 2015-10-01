class Api::V1::LibraryController < ApplicationController

  def initialize()
    @service = Api::V1::LibraryService.new
    @cache_service = Api::V1::CacheService.new(Api::V1::LibrarySerializer)
  end

  def index
    library = @service.get_current_user_library
    @cache_service.cache(library)
    render json: library, each_serializer: Api::V1::LibrarySerializer
  end
end
