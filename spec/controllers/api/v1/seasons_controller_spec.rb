require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do
  context 'index' do
    describe 'using api/v1/seasons endpoint' do

      before do
        create_list(:content, 5)
        create_list(:movie, 5)
        @contents = create_list(:season, 5) << create(:season, :with_episode, year: 1900)

        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the seasons in the body in the right schema' do
        expect(response).to match_response_schema('seasons')
      end

      it 'return the seasons in the order they have been pusblished' do
        expect(JSON.parse(response.body)['seasons'].first[:id]).to eq(@contents.last.as_json[:id])
      end

      it 'return the episodes of each season' do
        episodes = Hash.new('episodes' => @contents.last.episodes.as_json.each { |episode| episode.except!(:created_at, :updated_at)})

        expect(JSON.parse(response.body)['seasons'].first).to include(episodes)
      end
    end
  end
end
