class RoyalcirqueMailer < ActionMailer::Base

  def mail_royal_cirque(name,email,message)
    # @from = "#{email}"
    # @recipients = "info@royalcirquepub.com"
    # @subject = "Autogenerated Mail From Royal Cirque Contact Page"
    # @content_type = 'text/html'

    mail(to: "info@royalcirquepub.com", from: email, subject: 'Autogenerated Mail From Royal Cirque Contact Page')

    @name = "#{name}"
    @email = "#{email}"
    @sub = "Contact Message"
    @message = "#{message}"
  end

  def order_received(customer, order)
    @from = "order@royalcirquepub.com"
    @recipients = "info@royalcirquepub.com"
    @subject = "Autogenerated Mail From Royal Cirque Order"
    @content_type = 'text/html'
    @body[:name] = "#{customer.first_name} #{customer.last_name}"
    @body[:email] = "#{customer.email}"
    @body[:sub] = "Order Received"
    @body[:order] = order
  end
end
