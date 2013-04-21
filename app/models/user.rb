class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :auths
  ROLES = [:admin, :moderator]

  validates :email, uniqueness: true, format: {with: /@/}, allow_blank: true
  validates_presence_of :email, on: :create
end
