require 'application_system_test_case'

class RecordGroupsTest < ApplicationSystemTestCase
  setup do
    @record_group = record_groups(:one)
  end

  test 'visiting the index' do
    visit record_groups_url
    assert_selector 'h1', text: 'Record Groups'
  end

  test 'creating a Record group' do
    visit record_groups_url
    click_on 'New Record Group'

    click_on 'Create Record group'

    assert_text 'Record group was successfully created'
    click_on 'Back'
  end

  test 'updating a Record group' do
    visit record_groups_url
    click_on 'Edit', match: :first

    click_on 'Update Record group'

    assert_text 'Record group was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Record group' do
    visit record_groups_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Record group was successfully destroyed'
  end
end
