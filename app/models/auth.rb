class Auth < ActiveRecord::Base
  serialize :omni_hash, Hash
  belongs_to :user
end
