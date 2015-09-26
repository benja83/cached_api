require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do
  context 'index' do
    describe "using movie endpoint" do

      before do
        create_list(:content, 5)
        create_list(:movie, 5)
        @contents = create_list(:season, 5)
        @contents << create(:season, year: 1900)

        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the data in the body' do
        expect(format(response.body)).to match_array(format(@contents.to_json))
      end

      it "return the data in the order they are been created" do
        expect(format(response.body).first).to eql(format(@contents.to_json).last)
      end
    end
  end
end
