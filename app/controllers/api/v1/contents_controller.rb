class Api::V1::ContentsController < ApplicationController
  def index
    @current_uri = request.env['PATH_INFO'].split('/').last.singularize.capitalize

    contents = model_name.order(:created_at)
    render :json => contents
  end

  def model_names
    ['Content', 'Movie']
  end

  def model_name
    return @current_uri.constantize if @current_uri.in? model_names
  end
end
