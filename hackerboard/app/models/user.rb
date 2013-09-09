class User < ActiveRecord::Base
  attr_reader :password

  validates_presence_of :name, :password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_inclusion_of :role, in: %w[admin user]

  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy

  scope :signup, limit(20).order("id desc")

  def password=(password)
    encryption = PasswordEncryptor.encrypt(password)

    self.password_salt = encryption[:salt]
    self.password_hash = encryption[:hash]

    @password = password
  end

  def admin?
    role == "admin"
  end

  def to_json(options = {})
    options.merge!(except: [:password_hash, :password_salt])
    super(options)
  end
end