class History < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower
  validates :amount, presence:true, numericality: true
  validates :amount, :numericality => { :greater_than_or_equal_to => 0, message: "must be positive!"}
end
