require 'rails_helper'

RSpec.describe Api::V1::PurchasesController, type: :controller do
  describe 'POST #create' do
    before do
        create (:user)
        @contents = create_list(:content, 5) + create_list(:movie, 5) + create_list(:season, 5) << create(:content, year: 1900)
    end
    context 'with valid attributes' do
      it 'saves the new purchase in the database' do
        expect{
          post :create, { purchase: purchase_attributes,
                          content_id: @contents.first.id }
        }.to change(Purchase,:count).by(1)
      end
      it 'return the purchase as response' do
        post :create, { purchase: purchase_attributes,
                        content_id: @contents.first.id }
        expect(response).to match_response_schema('purchase')
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new purchase in the database' do
        expect{
          post :create, { purchase: purchase_invalid_attributes,
                          content_id: @contents.first.id }
        }.to change(Purchase,:count).by(0)
      end
      it 'return an error response' do
        post :create, { purchase: purchase_invalid_attributes,
                        content_id: @contents.first.id }
        expect(response).to match_response_schema('purchaseError')
      end
    end

    context 'with a content present in your library' do
      it 'does not save the new purchase in the database' do
        post :create, { purchase: purchase_attributes,
                        content_id: @contents.first.id }
        expect{
          post :create, { purchase: purchase_attributes,
                          content_id: @contents.first.id }
        }.to change(Purchase,:count).by(0)
      end
      it 'return an error response' do
        post :create, { purchase: purchase_attributes,
                        content_id: @contents.first.id }
        post :create, { purchase: purchase_attributes,
                        content_id: @contents.first.id }
        expect(response).to match_response_schema('purchaseError')
      end
    end
  end

  private

  def purchase_attributes
    FactoryGirl.attributes_for(:purchase)
  end

  def purchase_invalid_attributes
    FactoryGirl.attributes_for(:purchase, :invalid_purchase)
  end
end
