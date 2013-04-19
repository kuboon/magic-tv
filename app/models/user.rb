class User < ActiveRecord::Base
  authenticates_with_sorcery!
  ROLES = [:admin, :moderator]
end
