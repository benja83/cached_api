class Api::V1::LibraryService < ApplicationController
  def get_current_user_library
    current_user.purchases.library.order(:expiration_date)
  end
end
