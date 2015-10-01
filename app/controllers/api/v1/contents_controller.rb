class Api::V1::ContentsController < ApplicationController

  def initialize()
    @service = Api::V1::CacheService.new(Api::V1::ContentSerializer)
  end
  def index
    contents = Content.order(:year)
    @service.cache(contents)
    render json: contents, each_serializer: Api::V1::ContentSerializer
  end
end
