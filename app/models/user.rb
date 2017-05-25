class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  def email_required?
    true
  end
end
