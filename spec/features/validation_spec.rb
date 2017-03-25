require 'rails_helper'
feature "Password" do
  scenario "user tries to create an account without a number" do
      visit "/register"
      fill_in "lender_first_name", with: "Jian"
      fill_in "lender_last_name", with: "Zhang"
      fill_in "lender_email", with: "abc@email.com"
      fill_in "lender_password", with: "passwird"
      fill_in "lender_password_confirmation", with: "passwird"
      click_button "lender_register"
      expect(page).to have_content "Password must be at least 8 characters and include one number"
  end
end

feature "catch invalid information being added" do
  scenario "displays an error message if forms are not filled properly" do
      visit "/register"
      fill_in "borrower_email", with: "12@cs"
      fill_in "borrower_password", with: ""
      fill_in "borrower_last_name", with: "Zhang"
      click_button "borrower_register"
    expect(page).to have_content "Password can't be blank Password can't be blank Password is too short (minimum is 8 characters) Password must be at least 8 characters and include one number First name can't be blank Password confirmation can't be blank Purpose can't be blank Email is invalid"
  end
end
