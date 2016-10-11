class SignupConfirmationMailer < ApplicationMailer
  default from: "glocal@yunity.org"

  def signup_confirmation_email(sharer, explanation_text)
  	@explanation_text = explanation_text
    @sharer = sharer
    mail(to: @sharer.email, subject: 'Signup confirmation to glocal.yunity.org')
  end

end
