class Api::V1::LibraryController < ApplicationController

  def initialize()
    @service = Api::V1::LibraryService.new
  end

  def index
    library = @service.get_current_user_library
    render json: library, each_serializer: Api::V1::LibrarySerializer
  end
end
