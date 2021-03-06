require 'rails_helper'
require 'date'

RSpec.describe Api::V1::LibraryController, type: :controller do
  context 'index' do
    describe 'using api/v1/library' do
      before do
        user = create(:user)
        content = create_list(:content, 5)
        movie = create_list(:movie, 5)
        season = create_list(:season, 5)
        purchase1 = create(:purchase, user_id: user.id, expiration_date: DateTime.now - 3.days)
        purchase2 = create(:purchase, user_id: user.id, expiration_date: DateTime.now + 7.minutes)

        purchase3 = create(:purchase, user_id: user.id, expiration_date: DateTime.now + 1.minutes)

        @purchase = [purchase1, purchase2, purchase3]
        @ids = [purchase2.id, purchase3.id]
        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the purchased contents in the right schema' do
        expect(response).to match_response_schema('library')
      end

      it 'returns the purchased contents in order of expiration date' do
        expect(JSON.parse(response.body)['library'].first[:id]).to eq(@purchase.as_json.last[:id])
      end

      it 'returns the purchased contents without expired content' do
        parsed_response = JSON.parse(response.body)['library']
        ids=[]
        parsed_response.each { |e| ids <<  e['id'] }
        expect(ids).to match_array(@ids)
      end
    end
  end
end
