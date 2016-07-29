require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, String, length: 60

  attr_accessor :confirm_password
  attr_reader :password

  validates_confirmation_of :password, confirm: :confirm_password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
