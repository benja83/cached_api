class Api::V1::SeasonsController < ApplicationController

  def index

    contents = Season.order(:created_at)
    render :json => contents

  end

end
