require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  context 'index' do
    describe "using contents endpoint" do
      before do
        @contents = create_list(:content, 5) + create_list(:movie, 5) + create_list(:season, 5) << create(:content, year: 1900)
        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the data in the body' do
        expect(response).to match_response_schema("contents")
      end

      it "return the data in the order they are been created" do
        expect(JSON.parse(response.body)['contents'].first[:id]).to eq(@contents.last.as_json[:id])
      end

    end
  end
end
