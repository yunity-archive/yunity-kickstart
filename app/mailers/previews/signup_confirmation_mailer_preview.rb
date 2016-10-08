class ExampleMailerPreview < ActionMailer::Preview
  def signup_confirmation_email_preview
    ExampleMailer.sample_email(Sharer.first)
  end
end