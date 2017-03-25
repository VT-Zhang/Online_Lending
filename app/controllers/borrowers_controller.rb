class BorrowersController < ApplicationController
    before_action :require_login, except: [:create]

    def create
        borrower = Borrower.new(first_name: params[:borrower_first_name], last_name: params[:borrower_last_name], email: params[:borrower_email], password: params[:borrower_password], password_confirmation: params[:borrower_password_confirmation], money: params[:borrower_money], raised: "0", purpose: params[:borrower_purpose], discription: params[:borrower_discription])
        if borrower.valid?
            borrower.save
            flash[:notices] = ["Congrats, you have successfully registered as a Borrower, now you can log in!"]
            redirect_to "/login"
        else
            flash[:errors] = borrower.errors.full_messages
            redirect_to "/register"
        end
    end

    def show
        @lenders = Lender.all
    end
end
