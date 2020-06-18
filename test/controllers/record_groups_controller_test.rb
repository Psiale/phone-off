require 'test_helper'

class RecordGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_group = record_groups(:one)
  end

  test 'should get index' do
    get record_groups_url
    assert_response :success
  end

  test 'should get new' do
    get new_record_group_url
    assert_response :success
  end

  test 'should create record_group' do
    assert_difference('RecordGroup.count') do
      post record_groups_url, params: { record_group: {} }
    end

    assert_redirected_to record_group_url(RecordGroup.last)
  end

  test 'should show record_group' do
    get record_group_url(@record_group)
    assert_response :success
  end

  test 'should get edit' do
    get edit_record_group_url(@record_group)
    assert_response :success
  end

  test 'should update record_group' do
    patch record_group_url(@record_group), params: { record_group: {} }
    assert_redirected_to record_group_url(@record_group)
  end

  test 'should destroy record_group' do
    assert_difference('RecordGroup.count', -1) do
      delete record_group_url(@record_group)
    end

    assert_redirected_to record_groups_url
  end
end
