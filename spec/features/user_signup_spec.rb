require_relative 'web_helper'

feature 'user registration' do
  scenario 'allow a new user to sign up' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content "Welcome, bartjudge@gmail.com"
    expect(User.first.email).to eq "bartjudge@gmail.com"
  end


end
