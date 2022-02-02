require 'rails_helper'

feature 'Rodents Counter', puma: true, action_cable: :inline, active_job: :inline do
  background do
    driven_by :selenium, using: :headless_chrome
  end

  scenario 'Creating a rodent updates the dashboard rodents counter' do
    visit '/'

    expect(page).to have_text 'There are 0 rodents in the encyclopedia!'

    new_window = open_new_window
    within_window new_window do
      visit '/rodents/new'
      fill_in 'Name', with: 'Squirrel'
      click_on 'Create Rodent'
    end

    expect(page).to have_text 'There are 1 rodents in the encyclopedia!'
  end
end
