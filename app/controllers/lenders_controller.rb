class LendersController < ApplicationController
  before_action :require_login, except: [:create]

  def create
      lender = Lender.new(first_name: params[:lender_first_name], last_name: params[:lender_last_name], email: params[:lender_email], password: params[:lender_password], password_confirmation: params[:lender_password_confirmation], money: params[:lender_money])
      if lender.valid?
          lender.save
          flash[:notices] = ["Congrats, you have successfully registered as a Lender, now you can log in!"]
          redirect_to "/login"
      else
          flash[:errors] = lender.errors.full_messages
          redirect_to "/register"
      end
  end

  def show
      @borrowers = Borrower.all
  end
end
