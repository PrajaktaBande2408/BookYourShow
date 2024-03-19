require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "should belong to a showtime" do
    booking = bookings(:one)
    assert_instance_of Showtime, booking.showtime
  end
end