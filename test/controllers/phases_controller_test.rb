require 'test_helper'

class PhasesControllerTest < ActionController::TestCase
  setup do
    @phases = phases(:one)
  end
  
    test "should_get_phases_index" do
      get :index
      assert_response :success
    end
    
    test "should_get_phases_new" do
      get :new
      assert_response :success
    end  
 

    test "should_get_phases_show" do
      perm = Phase.first.permalink
      get :show, params: {permalink: perm}
      assert_response :success
    end
    
    test "should_get_phases_show_id" do
      get :show, params: {id: @phases.id }
      assert_response :success
    end

  test "should_redirect_to_phases_once_destroyed" do
    get :destroy, params: {id: @phases.id }
    assert_redirected_to "/phases"
  end
 

   test "should_get_patron_perk" do
    sign_in users(:one)
    perm = Phase.first.permalink
    get :patronperk, params: { permalink: perm}
    assert_response :success
   end

  test "show_get_phases_show_page" do
    get :show,params: {permalink: '1dh'}
    assert_response :success
  end

    test "should_get_phases_storytellerperks" do
      sign_in users(:one)
      get :storytellerperks, params: {permalink: '1dh'}
      assert_response :success
    end
    
    test "should_get_phases_edit" do
      sign_in users(:one)
      get :edit, params: {permalink: '1dh'}
      assert_response :success
    end    
end