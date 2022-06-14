class User < ApplicationRecord
  require 'securerandom'
  before_validation :generate_api_key

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest, :api_key

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
