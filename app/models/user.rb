class User < ApplicationRecord
  # Devise modules for authentication
  # Login with email, password reset, "remember me" checkbox
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :uuid, uniqueness: true, allow_nil: true
  validates :username, uniqueness: true, allow_blank: true,
            format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" },
            length: { minimum: 3, maximum: 20 }
  validates :admin, inclusion: { in: [true, false] }

  # Use UUID in URLs instead of ID
  def to_param
    uuid
  end

  # Check if user is admin
  def admin?
    admin
  end

  # Display name (fallback to email if no name/username)
  def display_name
    return full_name if name.present?
    return username if username.present?
    email.split('@').first
  end

  # Full name from first + last name
  def full_name
    [name, last_name].compact.join(' ').presence
  end
end
