require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do
  context 'index' do
    describe "using season endpoint" do

      before do
        create_list(:content, 5)
        create_list(:movie, 5)
        @contents = create_list(:season, 5)
      end

      it 'returns the correct status' do
        get :index
        expect(response.status).to eql(200)
      end

      it 'returns the data in the body' do
        get :index
        expect(format(response.body)).to match_array(format(@contents.to_json))
      end

      it "return the data in the order they are been created" do
        @contents << create(:season, year: 1900)
        get :index
        expect(format(response.body).first).to eql(format(@contents.to_json).last)
      end

      it "return the episodes of each season" do
        @contents << create(:season, :with_episode, year: 1900)
        get :index
        expect(format(response.body).first).to include("episodes" => format(Episode.all.to_a.to_json))
      end
    end
  end
end
