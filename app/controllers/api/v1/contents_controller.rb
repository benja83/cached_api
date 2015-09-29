class Api::V1::ContentsController < ApplicationController
  def index
    contents = Content.order(:year)
    render json: contents, each_serializer: Api::V1::ContentSerializer
  end
end
