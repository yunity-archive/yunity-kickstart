class SignupConfirmationMailer < ApplicationMailer
  default from: "yunity@sparkpostbox.com"

  def signup_confirmation_email(sharer, explanation_text)
  	@explanation_text = explanation_text
    @sharer = sharer
    mail(to: @sharer.email, subject: 'Signup confirmation to Yunity.org')
  end

end
