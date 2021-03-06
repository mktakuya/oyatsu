class User < ApplicationRecord
  has_secure_password
  has_secure_token

  before_validation :set_default_password, on: :create, if: Proc.new { |user| user.password_digest.blank? }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: { in: 8..128 }, if: -> { password.present? }
  validates :password_digest, presence: true
  validates :token, uniqueness: true

  has_many :items

  def update_without_password(params = {})
    params.delete(:password)
    params.delete(:password_confirmation)

    self.update_attributes(params)
  end

  private

  def set_default_password
    self.password = email.split('@')[0].reverse
  end
end
