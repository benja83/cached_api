class Api::V1::MoviesController < ApplicationController
  def index
    contents = Movie.order(:year)
    render :json => contents, each_serializer: Api::V1::MovieSerializer
  end
end
