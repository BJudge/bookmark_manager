feature 'User sign up' do
  scenario "I can sign up as a new user" do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, user101@email.com')
      expect(User.first.email).to eq('user101@email.com')
  end

  scenario "user cannot sign-up if password doesn't match the confirmed password" do
    expect { sign_up(confirm_password: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
