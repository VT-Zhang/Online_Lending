class Lender < ActiveRecord::Base
  has_secure_password
  has_many :histories, dependent: :destroy
  has_many :borrowers, through: :histories, source: :borrower

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  PASSWORD_VALIDATOR = /\A(?=.*\d)[A-Za-z\d]{8,}\z/i
  validates :first_name, :last_name, :email, :money, :password, :password_confirmation, presence:true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, length: {minimum: 8}, format: {with: PASSWORD_VALIDATOR, message: "must be at least 8 characters and include one number"} , :on => :create
end
