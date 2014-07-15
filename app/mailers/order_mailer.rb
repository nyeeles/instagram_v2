class OrderMailer < ActionMailer::Base
  default from: "no-reply@instagramay.com"

  def confirmation(order)
  	mail to: order.user.email, subject: 'Order confirmed'
  end
end
