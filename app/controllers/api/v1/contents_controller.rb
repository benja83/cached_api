class Api::V1::ContentsController < ApplicationController
  def index
    contents = Content.order(:created_at)
    render :json => contents
  end
end
