class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
  validates :password_digest, presence: true
  before_create :set_api_key

  private

  def set_api_key
    self.api_key = SecureRandom.uuid
  end
end
