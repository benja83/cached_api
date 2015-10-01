require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  context 'index' do
    describe 'using api/v1/movies' do

      before do
        create_list(:content,5)
        create_list(:season,5)
        @contents = create_list(:movie,5) << create(:movie, year: 1900)

        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the movies in the body in the right schema' do
        expect(response).to match_response_schema('movies')
      end

      it 'return the movies in the order they have been published' do
       expect(JSON.parse(response.body)['movies'].first[:id]).to eq(@contents.last.as_json[:id])
      end
    end
  end
end
