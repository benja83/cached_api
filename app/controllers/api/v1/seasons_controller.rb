class Api::V1::SeasonsController < ApplicationController

  def index
    contents = Season.order(:year)
    render :json => contents
  end

end
