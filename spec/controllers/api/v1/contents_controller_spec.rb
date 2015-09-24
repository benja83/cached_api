require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  context 'index' do
    before do
      @contents = []
      5.times do
        content = create(:content)
        @contents << content
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