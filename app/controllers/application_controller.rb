class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_lender
     Lender.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_lender

  def current_borrower
      Borrower.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_borrower

  def require_login
      if session[:user_id] == nil
          flash[:errors] = ["Please log in"]
          redirect_to "/login"
      end
  end


end
