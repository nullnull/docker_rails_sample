require 'rails_helper'

RSpec.describe 'top page', type: :feature do
  it 'show hello world' do
    visit users_path # TODO urlを指定した際のホスト名がおかしい？

    expect(page).to have_content 'User'
  end
end
