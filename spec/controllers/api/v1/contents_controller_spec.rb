require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  context 'index' do
    describe 'using api/v1/contents' do
      before do
        @contents = create_list(:content, 5) + create_list(:movie, 5) + create_list(:season, 5) << create(:content, year: 1900)
        get :index
      end

      it 'returns success status' do
        expect(response.status).to eql(200)
      end

      it 'returns the contents in the body in the right schema ' do
        expect(response).to match_response_schema('contents')
      end

      it 'returns the contents in the order they have been publish' do
        expect(JSON.parse(response.body)['contents'].first[:id]).to eq(@contents.last.as_json[:id])
      end

    end
  end
end
