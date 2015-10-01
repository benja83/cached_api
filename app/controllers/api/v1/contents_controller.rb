class Api::V1::ContentsController < ApplicationController

  # caches_action :index, :cache_path => proc {|c|
  #   content = Content.order('updated_at DESC').limit(1).first
  #   {:tag => post.updated_at.to_i}
  # }

  def index
    contents = Content.order(:year)
    #render_cached(contents, Api::V1::ContentSerializer)
    render json: contents, each_serializer: Api::V1::ContentSerializer
  end
end
