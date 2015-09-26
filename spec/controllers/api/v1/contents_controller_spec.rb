require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  context 'index' do
    describe "using contents endpoint" do
      before do
        @contents = []
        5.times do
          @contents << create(:content)
          @contents << create(:movie)
        end
        get :index
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the data in the body' do
        body = MultiJson.load(response.body)
        expect(response.body).to eql(@contents.to_json)
      end

      it "return the data in the order they are been created" do
        body = MultiJson.load(response.body)
        expect(response.body[0]).to eql(@contents.to_json[0])
      end
    end
  end
# end

# describe "Api::V1::ContentsController" do

  context 'index' do
    describe "using movie endpoint" do

      before do

        Rails.application.routes.draw do
          get "api/v1/movie", :controller=>"contents"
        end

        @contents = []
        5.times do
          create(:content)
          @contents << create(:movie)
        end
        get :api_v1_movie
      end

      it 'returns the correct status' do
        expect(response.status).to eql(200)
      end

      it 'returns the data in the body' do
        body = MultiJson.load(response.body)
        expect(response.body).to eql(@contents.to_json)
      end

      it "return the data in the order they are been created" do
        body = MultiJson.load(response.body)
        expect(response.body[0]).to eql(@contents.to_json[0])
      end
    end
  end
end
