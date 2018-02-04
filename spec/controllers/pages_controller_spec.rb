require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'Return home page' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #calculate' do
    it 'Valid parameters - valid result' do
      post :calculate, params: { text: 'The quick brown fox jumps over the lazy dog', format: :xml }
      expect(response).to have_http_status(200)
      expect(response.body).to eq('9-4-3-24-43')
    end
    it 'Empty parameter - empty result' do
      post :calculate, params: { text: '', format: :xml }
      expect(response).to have_http_status(200)
      expect(response.body).to eq('empty_error')
    end
    it 'Invalid parameters - empty result' do
      post :calculate, params: { text1: 'The quick brown fox jumps over the lazy dog', format: :xml }
      expect(response).to have_http_status(200)
      expect(response.body).to eq('empty_error')
    end
  end
end

RSpec.describe "routing to pages", :type => :routing do
  it "routes / to pages#index for home page" do
    expect(:get => "/").to route_to(
      :controller => "pages",
      :action => "index"
    )
  end

  it "does not expose a list of profiles" do
    expect(:get => "/rules").not_to be_routable
  end
end