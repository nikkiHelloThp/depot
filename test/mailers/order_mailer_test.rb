require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  fixtures :orders
  
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order confirmation", mail.subject
    assert_equal ["duke@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /1 x MySecondString/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Order shipped", mail.subject
    assert_equal ["duke@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /<td>1 &times;<\/td>\s*<td>MySecondString<\/td>/, mail.body.encoded
  end

end
