
feature 'user signing in' do
  let!(:user) do
        User.create(email: 'bartjudge@gmail.com',
                  password: 'password',
                  confirm_password: 'password')
                end
  scenario 'user signing in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end


end
