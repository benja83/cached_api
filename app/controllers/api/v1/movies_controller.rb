class Api::V1::MoviesController < ApplicationController

  def initialize()
    @service = Api::V1::CacheService.new(Api::V1::MovieSerializer)
  end
  def index
    contents = Movie.order(:year)
    @service.cache(contents)
    render :json => contents, each_serializer: Api::V1::MovieSerializer
  end
end
