require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = User.new(name: 'Bianca')
    @user.save
  end

  describe 'GET /index' do
    before do
      get users_path
    end

    it 'response status correct' do
      expect(response.status).to eq(200)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholders text' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET #show' do
  before do
    get user_path(@user)
  end

  it 'renders status correct' do
    expect(response).to have_http_status(:success)
  end

  it 'renders the show template' do
    expect(response).to render_template(:show)
  end

  it 'response body includes correct placeholders text' do
    expect(response.body).to include('Profile of User')
  end
end
end
