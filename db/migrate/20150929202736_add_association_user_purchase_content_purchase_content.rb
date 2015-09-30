class AddAssociationUserPurchaseContentPurchaseContent < ActiveRecord::Migration
  def change
    add_reference :purchases, :user, index: true
    add_reference :purchases, :content, index: true
  end
end
