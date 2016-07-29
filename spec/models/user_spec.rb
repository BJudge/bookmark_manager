
describe User do
  let(:user) { User.create email: 'bartjudge@gmail.com', password: 'password', confirm_password: 'password' }
  it 'should be able to authenticate registered users' do
    user_authenticate = User.authenticate(user.email, user.password)
    expect(user_authenticate).to eq user
  end
  it 'should not authenticate if the password is wrong' do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end
end
