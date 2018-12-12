require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Committee::Test::Methods
  include Rack::Test::Methods

  let!(:user) { User.create(name: 'hoge') }

  # describe 'GET /users' do
  #   it 'returns users' do
  #     get users_path(format: :json)
  #     expect(response).to have_http_status(200)
  #   end
  # end
  #
  # describe 'GET /users/:id' do
  #   it 'returns the user' do
  #     get users_path(format: :json)
  #     expect(response).to have_http_status(200)
  #   end
  # end

  def committee_schema
    @committee_schema ||=
      begin
        driver = Committee::Drivers::OpenAPI2.new
        schema = JSON.parse(File.read(schema_path))
        driver.parse(schema)
      end
  end

  def schema_path
    Rails.root.join('doc/apidoc/schema_swagger_form_data.json')
  end

  describe '/users/:id', type: :request do
    it 'レスポンスがAPIドキュメントと一致する' do
      get user_path(user, format: :json)
      assert_schema_conform
    end
  end
end
