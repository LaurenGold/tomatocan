require 'test_helper'

class RsvpqsControllerTest < ActionController::TestCase
  setup do
    @rsvpq = rsvpqs(:one)
  end

  test "ashould create rsvpq" do
    assert_difference('Rsvpq.count',1) do
      post :create, params: {rsvpq: { event_id: @rsvpq.event_id, user_id: @rsvpq.user_id } }
    end
  end

  test "aRedirectEvents" do
    post :create, params: {rsvpq: { event_id: @rsvpq.event_id, user_id: @rsvpq.user_id } }
    assert_redirected_to home_path  #back to events page after rsvp
  end

  test "ashould update rsvpq" do
    patch :update, params:{id: @rsvpq.id, rsvpq: { event_id: @rsvpq.event_id, guests: @rsvpq.guests, user_id: @rsvpq.user_id } }
    #assert_redirected_to rsvpq_path(assigns(:rsvpq))
     assert_redirected_to "http://test.host/login"
  end

  



  test "ashould display FLASH message for invalid email" do
    post rsvpqs_path, params: {rsvpq: { event_id: @rsvpq.event_id, email: "notavalidemail" } }
    #assert flash[:notice], 'Please enter a valid email address'
    assert_equal 'Please enter a valid email address', flash[:notice]
  end
  test "zshould not need email when logged in" do
    sign_in users(:one)
    post :create, params: {rsvpq: { event_id: @rsvpq.event_id} }
    puts @rsvpq.email
    puts @rsvpq.event_id
    puts @rsvpq.user_id
    puts "QQQQQQQQ"
    puts @rsvpq.id
    #assert_not_equal 'Please enter a valid email address', flash[:notice]
    assert_equal 'Rsvp was successfully created.', flash[:notice]
   end

end
