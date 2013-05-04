class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :auths
  ROLES = [:contributor, :moderator, :admin]

  validates :email, uniqueness: true, format: {with: /@/}, allow_blank: true
  validates_presence_of :email, on: :create

  before_save do
    if email_changed?
      self.email_active = false
      self.key = SecureRandom.hex(16)
      UserMailer.activate(self).deliver if email.present?
    end
  end
end
