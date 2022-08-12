class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end

  validates :email, presence: true
  validates :password, presence: true, confirmation: true

  has_many :transactions
end
