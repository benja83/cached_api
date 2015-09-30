class Api::V1::LibraryController < ApplicationController
  def index
    library = current_user.purchases.library.order(:expiration_date)
    render json: library
  end
end
