class Api::V1::SeasonsController < ApplicationController
  def initialize()
    @service = Api::V1::CacheService.new(Api::V1::SeasonSerializer)
  end

  def index
    contents = Season.includes(:episodes).order(:year)
    @service.cache(contents)
    render :json => contents, each_serializer: Api::V1::SeasonSerializer
  end
end
