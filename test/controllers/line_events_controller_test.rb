require 'test_helper'

class LineEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_event = line_events(:one)
  end

  test "should get index" do
    get line_events_url
    assert_response :success
  end

  test "should get new" do
    get new_line_event_url
    assert_response :success
  end

  test "should create line_event" do
    assert_difference('LineEvent.count') do
      post line_events_url, params: { line_event: {  } }
    end

    assert_redirected_to line_event_url(LineEvent.last)
  end

  test "should show line_event" do
    get line_event_url(@line_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_event_url(@line_event)
    assert_response :success
  end

  test "should update line_event" do
    patch line_event_url(@line_event), params: { line_event: {  } }
    assert_redirected_to line_event_url(@line_event)
  end

  test "should destroy line_event" do
    assert_difference('LineEvent.count', -1) do
      delete line_event_url(@line_event)
    end

    assert_redirected_to line_events_url
  end
end
