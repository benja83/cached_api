class Api::V1::PurchaseService < ApplicationController

  def createPurchase(content_id, purchase_params)

    content = Content.find(content_id)
    purchase = Purchase.new :user_id => current_user.id,
                            :content_id => content_id,
                            :quality => purchase_params[:quality],
                            :price => content.price
    if purchase.valid?
      purchase.save
      return purchase, Api::V1::PurchaseSerializer
    end
    return purchase, Api::V1::PurchaseErrorsSerializer
  end

  def current_user_library
    current_user.purchases.library
  end

end
