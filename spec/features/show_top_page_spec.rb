require 'rails_helper'

RSpec.describe 'top page', type: :feature do
  it 'show hello world' do
    visit users_url

    expect(page).to have_content 'User'
  end
end
