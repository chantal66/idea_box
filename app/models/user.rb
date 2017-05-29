class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :ideas
  has_many :categories, source: :ideas

  enum role: ['default', 'admin']

end
