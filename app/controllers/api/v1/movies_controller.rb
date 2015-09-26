class Api::V1::MoviesController < ApplicationController

  def index

    contents = Movie.order(:created_at)
    render :json => contents

  end

end
