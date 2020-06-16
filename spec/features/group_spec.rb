require 'rails_helper'

RSpec.describe 'Creating Groups on group page', type: :feature do
  let(:file) { fixture_file_upload(Rails.root.join('app/assets/images/', 'unnamed.png'), 'image/png') }
  let(:user1) { User.create(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  # let(:group) {Group.create(name: 'new record', user: user1, icon: file) }
  before :each do
    user = User.create(name: 'Oscar', email: 'a@mail.com', password: '123456')
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit groups_path
  end

  scenario 'The user is on the  groups page' do
    expect(page).to have_content("You don't have any group yet")
  end
  scenario 'Creates new group successfully' do
    click_on 'Create a new one'
    fill_in 'Name your group, please', with: 'Unnamed'
    attach_file(File.absolute_path('app/assets/images/unnamed.png'))
    click_on 'Submit'
    expect(page).to have_content('Group was successfully created.')
  end
  scenario 'View the new created group' do
    click_on 'Create a new one'
    fill_in 'Name your group, please', with: 'Unnamed'
    attach_file(File.absolute_path('app/assets/images/unnamed.png'))
    click_on 'Submit'
    click_on 'Back'
    expect(page).to have_content('View')
  end

  scenario 'See the record name associated to the new created group' do
    click_on 'Create a new one'
    fill_in 'Name your group, please', with: 'Unnamed'
    attach_file(File.absolute_path('app/assets/images/unnamed.png'))
    click_on 'Submit'
    visit records_path
    fill_in 'Name your record, please', with: 'My record.'
    fill_in 'time', with: '10'
    check 'record[group_id][]'
    click_on 'submit'
    visit groups_path
    click_on 'View'
    expect(page).to have_content('Record name')
  end
end
