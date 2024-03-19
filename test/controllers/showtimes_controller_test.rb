require 'test_helper'

class ShowtimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showtime = showtimes(:one)
    @movie = movies(:one)
  end

  test "should get index" do
    get showtimes_url
    assert_response :success
  end

  test "should show showtime" do
    get showtime_url(@showtime)
    assert_response :success
  end

  test "should book ticket" do
    assert_difference('Booking.count') do
      post book_ticket_showtime_url(@showtime), params: { user_name: "Test User" }
    end

    assert_redirected_to showtime_url(@showtime)
  end

  test "should cancel ticket" do
    booking = bookings(:one)
    assert_difference('Booking.count', -1) do
      delete cancel_ticket_showtime_url(@showtime, booking)
    end

    assert_redirected_to showtime_url(@showtime)
  end
end