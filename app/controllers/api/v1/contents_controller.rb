class Api::V1::ContentsController < ApplicationController
  def index

    contents = Content.order(:year)
    render :json => contents

  end
end
