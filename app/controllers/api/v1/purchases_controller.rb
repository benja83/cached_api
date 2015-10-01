class Api::V1::PurchasesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def initialize()
    @service = Api::V1::PurchaseService.new
  end

  def create
    @purchase, serializer = @service.createPurchase(params[:content_id], purchase_params)
    render :json => @purchase, serializer: serializer
  end

  private

  def purchase_params
    params.require(:purchase).permit(:content_id, :price, :quality)
  end
end
