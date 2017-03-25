class SessionsController < ApplicationController
  def new
      session[:user_id] = nil
  end

  def create
      if @user = Lender.find_by(email: params[:email])
          if @user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, Please try again."]
              redirect_to "/login"
          else
              session[:user_id] = @user.id
              redirect_to "/lender/#{@user.id}"
          end

      elsif @user = Borrower.find_by(email: params[:email])
          if @user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, Please try again."]
              redirect_to "/login"
          else
              session[:user_id] = @user.id
              redirect_to "/borrower/#{@user.id}"
          end
      else
          flash[:errors] = ["The user does not exist, please register."]
          redirect_to "/login"
      end
  end

  def destroy
      reset_session
      flash[:notices] = ["Successfully Logged Out!"]
      redirect_to "/login"
  end
end
