class Sharer < ApplicationRecord
  validate :check_email # Checks that email is not blank and that it is a valid email adress.
		#validates :email, uniqueness: true, uniqueness: { message: "has already been registered." }
  validates :name, presence: true, presence: { message: " is needed." }
  validates :city, presence: true, presence: { message: " is needed." }

  def check_email
    if email.blank?
    	errors.add(:email, " is required.")
    else
    	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end
end
