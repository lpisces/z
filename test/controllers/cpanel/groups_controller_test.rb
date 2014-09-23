require 'test_helper'

class Cpanel::GroupsControllerTest < ActionController::TestCase
  setup do
    @cpanel_group = cpanel_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpanel_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpanel_group" do
    assert_difference('Cpanel::Group.count') do
      post :create, cpanel_group: { description: @cpanel_group.description, name: @cpanel_group.name }
    end

    assert_redirected_to cpanel_group_path(assigns(:cpanel_group))
  end

  test "should show cpanel_group" do
    get :show, id: @cpanel_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpanel_group
    assert_response :success
  end

  test "should update cpanel_group" do
    patch :update, id: @cpanel_group, cpanel_group: { description: @cpanel_group.description, name: @cpanel_group.name }
    assert_redirected_to cpanel_group_path(assigns(:cpanel_group))
  end

  test "should destroy cpanel_group" do
    assert_difference('Cpanel::Group.count', -1) do
      delete :destroy, id: @cpanel_group
    end

    assert_redirected_to cpanel_groups_path
  end
end
