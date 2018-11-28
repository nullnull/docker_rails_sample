require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { User.create(name: 'hoge') }

  describe 'GET /users' do
    it 'returns users' do
      get users_path(format: :json)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'returns the user' do
      get users_path(format: :json)
      expect(response).to have_http_status(200)
    end
  end
end
