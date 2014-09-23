require 'test_helper'

class Cpanel::ComponentsControllerTest < ActionController::TestCase
  setup do
    @cpanel_component = cpanel_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpanel_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpanel_component" do
    assert_difference('Cpanel::Component.count') do
      post :create, cpanel_component: { component: @cpanel_component.component, status: @cpanel_component.status, sub: @cpanel_component.sub }
    end

    assert_redirected_to cpanel_component_path(assigns(:cpanel_component))
  end

  test "should show cpanel_component" do
    get :show, id: @cpanel_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpanel_component
    assert_response :success
  end

  test "should update cpanel_component" do
    patch :update, id: @cpanel_component, cpanel_component: { component: @cpanel_component.component, status: @cpanel_component.status, sub: @cpanel_component.sub }
    assert_redirected_to cpanel_component_path(assigns(:cpanel_component))
  end

  test "should destroy cpanel_component" do
    assert_difference('Cpanel::Component.count', -1) do
      delete :destroy, id: @cpanel_component
    end

    assert_redirected_to cpanel_components_path
  end
end
