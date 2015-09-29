class Api::V1::SeasonsController < ApplicationController

  def index
    contents = Season.includes(:episodes).order(:year)
    render :json => contents, each_serializer: Api::V1::SeasonSerializer
  end

end
