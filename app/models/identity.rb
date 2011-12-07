class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates_presence_of :email
  validates_uniqueness_of :email
end
