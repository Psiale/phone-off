# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating records on Index page', type: :feature do
  let(:file) { fixture_file_upload(Rails.root.join('app/assets/images/', 'unnamed.png'), 'image/png') }
  let(:user1) { User.create(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  # let(:group) {Group.create(name: 'new record', user: user1, icon: file) }
  before :each do
    user = User.create(name: 'Oscar', email: 'a@mail.com', password: '123456')
    Group.create(name: 'new record', user: user, icon: file)
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit index_no_group_path
  end
  scenario 'The user is on the  index_no_group page' do
    expect(page).to have_content('New Record without group')
  end
  scenario 'Creates new record successfully' do
    fill_in 'Name your record, please', with: 'My record without group.'
    fill_in 'time', with: '10'
    # find(:css, "#record_group_id_[value='3']").set(true)
    click_button
    expect(page).to have_content('Record was successfully created.')
  end

  scenario 'Creates new record with group successfully and goes to the record show page' do
    fill_in 'Name your record, please', with: 'My record.'
    fill_in 'time', with: '10'
    check 'record[group_id][]'
    click_on 'submit'
    expect(page).to have_css('.user-photo')
  end

  scenario 'Creates new record with group successfully, then go back to the index page to find the new created content' do
    fill_in 'Name your record, please', with: 'My record.'
    fill_in 'time', with: '10'
    check 'record[group_id][]'
    click_on 'submit'
    click_on 'With group'
    expect(page).to have_css('.item-image')
  end
end

RSpec.describe 'Creating records on Index page', type: :feature do
  let(:file) { fixture_file_upload(Rails.root.join('app/assets/images/', 'unnamed.png'), 'image/png') }
  let(:user1) { User.create(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  # let(:group) {Group.create(name: 'new record', user: user1, icon: file) }
  before :each do
    user = User.create(name: 'Oscar', email: 'a@mail.com', password: '123456')
    Group.create(name: 'new record', user: user, icon: file)
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end
  scenario 'The user is on the records page' do
    expect(page).to have_content('New Record')
  end
  scenario 'Creates new record without group successfully' do
    fill_in 'Name your record, please', with: 'My record.'
    fill_in 'time', with: '10'
    # find(:css, "#record_group_id_[value='3']").set(true)
    click_button
    click_on 'No group'
    expect(page).to have_css('.item-image')
  end
end
