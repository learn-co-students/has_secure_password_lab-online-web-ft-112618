class User < ActiveRecord::Base
  validates :password, confirmation: true

  def authenticate(password_attempt)
    self.password == password_attempt ? self : nil
  end
end
