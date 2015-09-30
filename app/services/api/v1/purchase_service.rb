class Api::V1::PurchaseService
  def createPurchase(params, purchase_params)
    @user = User.first
    purchase = Purchase.new new_params(params, purchase_params)
    if purchase.valid?
      purchase.save
      return purchase, Api::V1::PurchaseSerializer
    end
    return purchase, Api::V1::PurchaseErrorsSerializer
  end

  def new_params(params, purchase_params)
    purchase_params.merge(:user_id => @user.id, :content_id =>params[:content_id])
  end
end
