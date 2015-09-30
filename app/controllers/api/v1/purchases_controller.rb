class Api::V1::PurchasesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    @purchase, serializer = Api::V1::PurchaseService.new.createPurchase(params, purchase_params)
    render :json => @purchase, serializer: serializer
  end

  private

  def purchase_params
    params.require(:purchase).permit(:content_id, :price, :quality)
  end
end
